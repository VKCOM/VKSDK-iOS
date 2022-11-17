// swift-tools-version:5.5
// package-version:0.90.0
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.90.0/SDK.zip",
            checksum: "3687bb2045848268366dd19e44ffd5edc62a2a4508aa9d3b847643dae4bf0c53"
        )
    ]
)
