// swift-tools-version:5.5
// package-version:0.102.0
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.102.0/VKSDK.zip",
            checksum: "6942e102f23f89ccbca53e3dfa89c4ca62fef6a32f42d02ecd3813d36e82d616"
        )
    ]
)
