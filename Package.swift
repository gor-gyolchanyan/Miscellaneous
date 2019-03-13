// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "miscellaneous",
    products: [
        .library(
            name: "Miscellaneous",
            targets: ["Miscellaneous"]),
    ],
    targets: [
        .target(
            name: "Miscellaneous",
            dependencies: []),
        .testTarget(
            name: "MiscellaneousTests",
            dependencies: ["Miscellaneous"]),
    ]
)
