// swift-tools-version:5.5
// package-version:0.88.0
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.88.0/SDK.zip",
            checksum: "2de3259dd346229e431d1d182ccbd9e12dab8c6a9e2dc20329979877b9e7c915"
        )
    ]
)
