// swift-tools-version:5.5
// package-version:0.91.0
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.91.0/SDK.zip",
            checksum: "71cec8e27dc56d26438776f5c77431886d3a4c2dc9a247ff216285d0b451f172"
        )
    ]
)
