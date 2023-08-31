// swift-tools-version:5.5
// package-version:0.104.0
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.104.0/VKSDK.zip",
            checksum: "b0350c7531c039fbba2b5784253a3afeae5713f21d410c29028fcf93a5f5fa0c"
        )
    ]
)
