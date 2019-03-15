// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Miscellaneous",
    products: [
        .library(
            name: "Miscellaneous",
            targets: ["Miscellaneous"]
        ),
    ],
    targets: [
        .target(
            name: "Miscellaneous"
        ),
        .target(
            name: "MiscellaneousSample1",
            dependencies: ["Miscellaneous"]
        ),
        .testTarget(
            name: "MiscellaneousTests",
            dependencies: ["Miscellaneous"]
        ),
    ]
)