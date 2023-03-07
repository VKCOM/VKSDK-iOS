// swift-tools-version:5.5
// package-version:0.98.0
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.98.0/SDK.zip",
            checksum: "2839bdc75ec20d46da55e2f21a2c803a9aa104c7bb9b6dd77f0e5b37e595665d"
        )
    ]
)
