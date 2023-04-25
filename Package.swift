// swift-tools-version:5.5
// package-version:0.100.1
import PackageDescription

let package = Package(
    name: "VKSDK",
    platforms: [.iOS("11.4")],
    products: [
        .library(
            name: "VK",
            targets: ["VK"]
        )
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "VK",
            dependencies: [
                "VKSDK",
                
            ]
        ),
        .binaryTarget(
            name: "VKSDK",
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.100.1/SDK.zip",
            checksum: "58b41a206fc6376106e49849460f8d99fee356c44b24d3fd7fcd4b2a5cdc2c3c"
        )
    ]
)
