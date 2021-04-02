// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BigInt",
    products: [
        .library(
            name: "BigInt",
            targets: ["BigInt"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "BigInt",
            dependencies: []),
        .testTarget(
            name: "BigIntTests",
            dependencies: ["BigInt"]),
    ]
)
