// swift-tools-version: 5.9.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift",
    products: [
        .library(
            name: "swift",
            targets: ["swift"]),
    ],
    dependencies: [
      .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.3"),
    ],
    targets: [
        .target(
            name: "swift"),
        .testTarget(
            name: "swiftTests",
            dependencies: ["swift"]),
    ]
)
