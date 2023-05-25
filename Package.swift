// swift-tools-version:5.5
// package-version:0.101.2-alpha.10835777
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.101.2-alpha.10835777/VKSDK.zip",
            checksum: "e72d3b9c5b7b3a21c81c4fb13a62b7f1c2ee35dcd6afc551ea54dde5b92e027b"
        )
    ]
)
