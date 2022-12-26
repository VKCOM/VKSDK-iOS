// swift-tools-version:5.5
// package-version:0.93.0
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.93.0/SDK.zip",
            checksum: "8cc606d124a3be3dd8176503c935c7aafafb85c95a3de886ea398f909f245296"
        )
    ]
)
