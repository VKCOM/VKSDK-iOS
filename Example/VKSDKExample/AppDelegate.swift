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

import UIKit
import VKSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    static private(set) var sharedVK: VK.Type2<App, VKID>?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        guard
            let clientId = Bundle.main.infoDictionary?["ClientId"] as? String,
            let clientSecret = Bundle.main.infoDictionary?["ClientSecret"] as? String
        else {
            fatalError(
                "Add ClientId and ClientSecret fields, containing your app credentials, to configuration file (Info.plist) of demo app"
            )
        }

        do {
            Self.sharedVK = try VK {
                App(mode: .debug, credentials: .init(clientId: clientId, clientSecret: clientSecret))
                VKID()
            }
        } catch {
            fatalError("Couldn't initialize VKSDK, error: \(error)")
        }

        window = UIWindow()
        window?.rootViewController = AuthViewController()
        window?.makeKeyAndVisible()

        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        (try? Self.sharedVK?.open(url: url)) ?? false
    }

    func application(
        _ application: UIApplication,
        continue userActivity: NSUserActivity,
        restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void
    ) -> Bool {
        if
            let webpageURL = userActivity.webpageURL,
            let openResult = try? Self.sharedVK?.open(url: webpageURL)
        {
            return openResult
        }

        return false
    }
}
