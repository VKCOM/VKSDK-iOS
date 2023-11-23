// swift-tools-version:5.5
// package-version:0.108.0
import PackageDescription

let package = Package(
    name: "VKSDK",
    platforms: [.iOS("12.0")],
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.108.0/VKSDK.zip",
            checksum: "4416487fdb9b6e4e953671497dbf190409fc5aba8d3931647bbcd8515975a2a7"
        )
    ]
)
