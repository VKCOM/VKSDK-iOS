// swift-tools-version:5.5
// package-version:0.88.0-alpha.9467717
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.88.0-alpha.9467717/SDK.zip",
            checksum: "83903c316f90a2f6175414dd8cf1cbef6a6e06467984303f0537dfb74a255e61"
        )
    ]
)
