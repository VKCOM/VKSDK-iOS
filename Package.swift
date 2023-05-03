// swift-tools-version:5.5
// package-version:0.101.0
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.101.0/VKSDK.zip",
            checksum: "f8aa9de7d9a5c69a0d6cf0ca04ea92d991d73bd053f3d3f904e5e4bc00198322"
        )
    ]
)
