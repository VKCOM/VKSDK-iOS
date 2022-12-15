// swift-tools-version:5.5
// package-version:0.92.0
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.92.0/SDK.zip",
            checksum: "b186e04f10484df9384f02089fdc9f0f8d5c4a715a2fb39281d28ec6b6acf1c5"
        )
    ]
)
