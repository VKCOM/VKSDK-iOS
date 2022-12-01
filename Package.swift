// swift-tools-version:5.5
// package-version:0.91.1
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.91.1/SDK.zip",
            checksum: "6e39801b68bc0c664885e19cf152f71b39a05768bba94e6886201d3ac7dc02fb"
        )
    ]
)
