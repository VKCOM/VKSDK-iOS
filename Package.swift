// swift-tools-version:5.5
// package-version:0.89.0
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.89.0/SDK.zip",
            checksum: "0d6f79403ad6c28293b7610bd04a23bfd76053f79d4cd6123dec6240c452ed72"
        )
    ]
)
