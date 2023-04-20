// swift-tools-version:5.5
// package-version:0.100.0
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.100.0/SDK.zip",
            checksum: "80f4f2919c750a77ce8803963c49620806d748990c6c92a6c0d382dbe25d8109"
        )
    ]
)
