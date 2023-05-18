// swift-tools-version:5.5
// package-version:0.101.1
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.101.1/VKSDK.zip",
            checksum: "b9260236be68f21e1db071d82dd602cbd0a432a5a55e889668ec271cfc71d882"
        )
    ]
)
