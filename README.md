# What is the VK SDK?
The VK SDK is a collection of libraries that will help:
- make any app a part of the VK ecosystem
- turn your app into a super app by integrating services into your app without having to put in any additional effort into development

The general module of the SDK is VK ID, a single platform for authentication and user registration in various VK ecosystem services.
For details, see [Documentation](https://platform.vk.com/?p=DocsDashboard&docs=install-sdk_install-sdk-ios-v2).

## Installation

### Swift Package Manager

Add VK SDK as a dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/VKCOM/VKSDK-iOS.git", .upToNextMajor(from: "0.89.0"))
]
```

### CocoaPods

Specify in your `Podfile`:

```ruby
pod 'VK-SDK'
```

Run the following commands to install dependencies:

```shell
pod install --repo-update
```

### Carthage

Specify in your `Cartfile`:
```shell
binary "https://artifactory-external.vkpartner.ru/artifactory/VKSDK/VKSDK-Carthage.json"
```

Run the following commands to install dependencies:

```shell
carthage update --use-xcframeworks
```
