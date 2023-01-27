// swift-tools-version:5.5
// package-version:0.95.0
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.95.0/SDK.zip",
            checksum: "586f6408db39f4d92b7805ea400a1f719b9a17bd602b29ad6e9f32dd5cc0f72e"
        )
    ]
)
