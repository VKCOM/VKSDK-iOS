// swift-tools-version:5.5
// package-version:0.95.0-10362292
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.95.0-10362292/SDK.zip",
            checksum: "99054731dce919daa71f6daddd7a86828447a4f431a75e54bf4ac80f723ab67b"
        )
    ]
)
