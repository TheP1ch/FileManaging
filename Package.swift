// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FileManaging",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "FileManaging",
            targets: ["FileManaging"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FileManaging")
    ]
)
