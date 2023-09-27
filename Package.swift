// swift-tools-version:5.5
// package-version:0.105.0
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.105.0/VKSDK.zip",
            checksum: "f9dccb3bc031263d4c9b67b761bfe3afb11cc3a81502cabdc4880bdb7250305d"
        )
    ]
)
