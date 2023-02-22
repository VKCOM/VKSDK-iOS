// swift-tools-version:5.5
// package-version:0.97.1
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
            url: "https://artifactory-external.vkpartner.ru/artifactory/superappkit/0.97.1/SDK.zip",
            checksum: "4bf7e059ea3730f354f91c931da17f6fd3fa73f749783f7ba9e738ff519609bd"
        )
    ]
)
