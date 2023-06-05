// swift-tools-version:5.5
// package-version:0.101.2-alpha.10885179
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.101.2-alpha.10885179/VKSDK.zip",
            checksum: "79f6dd11580f278a96fd695362a78deebf5f73acb549b5270c97d80ed6fa79b5"
        )
    ]
)
