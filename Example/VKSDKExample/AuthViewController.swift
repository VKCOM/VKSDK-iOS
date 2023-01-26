//
//  Copyright (c) 2020 - present, LLC “V Kontakte”
//
//  1. Permission is hereby granted to any person obtaining a copy of this Software to
//  use the Software without charge.
//
//  2. Restrictions
//  You may not modify, merge, publish, distribute, sublicense, and/or sell copies,
//  create derivative works based upon the Software or any part thereof.
//
//  3. Termination
//  This License is effective until terminated. LLC “V Kontakte” may terminate this
//  License at any time without any without any negative consequences to our rights.
//  You may terminate this License at any time by deleting the Software and all copies
//  thereof. Upon termination of this license for any reason, you shall continue to be
//  bound by the provisions of Section 2 above.
//  Termination will be without prejudice to any rights LLC “V Kontakte” may have as
//  a result of this agreement.
//
//  4. Disclaimer of warranty and liability
//  THE SOFTWARE IS MADE AVAILABLE ON THE “AS IS” BASIS. LLC “V KONTAKTE” DISCLAIMS
//  ALL WARRANTIES THAT THE SOFTWARE MAY BE SUITABLE OR UNSUITABLE FOR ANY SPECIFIC
//  PURPOSES OF USE. LLC “V KONTAKTE” CAN NOT GUARANTEE AND DOES NOT PROMISE ANY
//  SPECIFIC RESULTS OF USE OF THE SOFTWARE.
//  UNDER NO SIRCUMSTANCES LLC “V KONTAKTE” BEAR LIABILITY TO THE LICENSEE OR ANY
//  THIRD PARTIES FOR ANY DAMAGE IN CONNECTION WITH USE OF THE SOFTWARE.
//

import OSLog
import UIKit
import VKSDK

// MARK: - AuthViewController

final class AuthViewController: UIViewController {

    private var button: UIControl?

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            self.view.backgroundColor = .systemBackground
        } else {
            self.view.backgroundColor = .white
        }

        do {
            try self.setupOneTapButton()
        } catch {
            os_log("Couldn't setup OneTapButton, error: %@", type: .error, error.localizedDescription)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        button?.frame = .init(
            origin: .zero,
            size: .init(
                width: min(335, view.bounds.width - 12 * 2),
                height: 48
            )
        )
        button?.center = view.center
    }

    private func setupOneTapButton() throws {
        guard let vk = AppDelegate.sharedVK else {
            return
        }

        /// While creating OneTapButton you can provide a ControllerConfiguration,
        /// which will present a controller on button tap on your presenter
        let authController = authControllerForOauthCodeFlow()

        let oneTapButton = VKID.OneTapButton(
            controllerConfiguration: .authController(authController, presenter: .newUIWindow)
        )
        let button = try vk.vkid.ui(for: oneTapButton).uiView()
        button.accessibilityIdentifier = "start_screen.auth_button"

        /// But also you can skip ControllerConfiguration parameter and provide your own action,
        /// which will present Authentication controller
        /// Example code below

        // let oneTapButton = VKID.OneTapButton()
        // let button = try vk.vkid.ui(for: oneTapButton).uiView()
        // button.addTarget(self, action: #selector(showAuthController), for: .touchUpInside)

        self.view.addSubview(button)
        self.button = button
    }

    /// Конфигурация флоу через extrernal с tokenExchanger работает через Silent Token,
    /// и подразумевает, что у вас есть сервер, через который обменивается Silent Token
    ///
    /// [Подробнее об обмене](https://platform.vk.com/?p=DocsDashboard&docs=tokens_access-token)
    ///
    /// Если вы хотите использовать Access Token на устройстве, то вам нужно использовать `.externalCodeFlow()`
    /// См. ``AuthViewController.authControllerForOauthCodeFlow()``
    private func authControllerForSilentTokenFlow() -> VKID.AuthController {
        VKID.AuthController(
            flow: .exchanging(tokenExchanger: .custom(weak: self)),
            delegate: self
        )
    }

    /// Конфигурация флоу через externalCodeFlow работает через Auth Code Flow,
    /// и вовзращает вам сразу же Access Token, без необходимости самостоятельного обмена Silent Token'а или Auth Code
    ///
    /// Предпочтительнее использовать этот флоу
    private func authControllerForOauthCodeFlow() -> VKID.AuthController {
        VKID.AuthController(
            flow: .externalCodeFlow(),
            delegate: self
        )
    }

    @objc
    private func showAuthController() {
        guard let vk = AppDelegate.sharedVK else {
            return
        }

        do {
            let authController = self.authControllerForOauthCodeFlow()
            let controller = try vk.vkid.ui(for: authController).uiViewController()

            self.present(controller, animated: true)
        } catch {
            os_log("Couldn't create AuthController, error: %@", type: .error, error.localizedDescription)
        }
    }
}

// MARK: VKIDFlowDelegate

extension AuthViewController: VKIDFlowDelegate {
    func vkid(_ vkid: VKID.Module, didCompleteAuthWith result: Result<VKID.UserSession, Error>) {
        do {
            let session = try result.get()

            switch session.state {
            case .authenticated:
                os_log("Authorization succeeded with authenticated state")
            case .authorized(let authorized):
                os_log("Authorization succeeded with authorized state")

                /// In authorized state you can request user's profile
                authorized.requestProfile { result in
                    do {
                        let profile = try result.get()
                        os_log("Authorized user profile: %@", profile.name?.description ?? "")
                    } catch {
                        os_log("Profile request failed, error: %@", type: .error, error.localizedDescription)
                    }
                }
            @unknown default:
                fatalError("Unsupported UserSession state")
            }
        } catch {
            os_log("Authorization failed, error: %@", type: .error, error.localizedDescription)
        }
    }
}

// MARK: - ErrorKind

enum ErrorKind: Error {
    case tokenExchangingError
}

// MARK: - AuthViewController + TokenExchanging

extension AuthViewController: TokenExchanging {
    struct ExchangeSilentTokenResponse: Codable {
        let response: TokenData
    }

    struct TokenData: Codable {
        let userId: Int
        let accessToken: String

        private enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case accessToken = "access_token"
        }
    }

    func exchange(silentToken: VKID.SilentToken, completion: @escaping (Result<VKID.AccessToken, Error>) -> Void) {
        guard let silentTokenExchangeURLString = Bundle.main.infoDictionary?["SilentTokenExchangeURL"] as? String else {
            /// Exchange silent token for access token — perform a back-to-back request.
            /// To do this, in the demo app configuration file (Info.plist) add your backend URL in SilentTokenExchangeURL field.
            completion(.failure(ErrorKind.tokenExchangingError))
            return
        }

        var components = URLComponents(string: silentTokenExchangeURLString)

        var queryItems = components?.queryItems ?? []
        // Maybe you will need other parameters for your URL
        queryItems.append(contentsOf: [
            URLQueryItem(name: "silent_token", value: silentToken.token.value),
            URLQueryItem(name: "uuid", value: silentToken.uuid),
        ])
        components?.queryItems = queryItems

        guard let url = components?.url else {
            completion(.failure(ErrorKind.tokenExchangingError))
            return
        }

        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, _ in
            DispatchQueue.main.async {
                guard
                    let data = data,
                    let exchangeResponse = try? JSONDecoder().decode(ExchangeSilentTokenResponse.self, from: data)
                else {
                    completion(.failure(ErrorKind.tokenExchangingError))
                    return
                }
                completion(.success(.init(
                    .init(exchangeResponse.response.accessToken),
                    userID: .init(exchangeResponse.response.userId)
                )))
            }
        }.resume()
    }
}
