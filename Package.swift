// swift-tools-version:5.5
// package-version:0.97.0
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.97.0/SDK.zip",
            checksum: "cae04af2dc58fe989e31d3800493c2e44dca855c0dcacb3896a5013be1cba16e"
        )
    ]
)
