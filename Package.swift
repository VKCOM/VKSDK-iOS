// swift-tools-version:5.5
// package-version:0.99.0
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.99.0/SDK.zip",
            checksum: "4cbb9fe7e83d0a369be17914c3276854d82355ae4746896df09b71845ad0d2fc"
        )
    ]
)
