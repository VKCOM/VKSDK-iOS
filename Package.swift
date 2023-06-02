// swift-tools-version:5.5
// package-version:0.101.2-alpha.10876645
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.101.2-alpha.10876645/VKSDK.zip",
            checksum: "ab104640ddc4e96a41783bf40904caac469923663f8907803e8677dd299c191d"
        )
    ]
)
