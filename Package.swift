// swift-tools-version:5.5
// package-version:0.96.0
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.96.0/SDK.zip",
            checksum: "56154e5cc90dd198a8bfc6d57b042f1e021f7e616f3061de4f0de47c722ae433"
        )
    ]
)
