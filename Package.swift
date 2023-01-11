// swift-tools-version:5.5
// package-version:0.94.0
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.94.0/SDK.zip",
            checksum: "579d797efad0db07ce1e39a42802b810cdb7dd611624ae54fd131195866ffe7c"
        )
    ]
)
