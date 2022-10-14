// swift-tools-version:5.5
// package-version:0.88.0-alpha.9457440
import PackageDescription

let package = Package(
    name: "VKSDK",
    platforms: [.iOS(.v13)],
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.88.0-alpha.9457440/SDK.zip",
            checksum: "2b0ca93eca98dae5e4a0317d36f61666876702f0d9f68fb51e5f599c366af95a"
        )
    ]
)
