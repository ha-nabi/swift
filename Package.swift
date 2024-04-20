// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "swift",
    platforms: [.macOS(.v10_13)],
    products: [
        .plugin(name: "FormatSwift", targets: ["FormatSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.3"),
    ],
    targets: [
        .plugin(
            name: "FormatSwift",
            capability: .command(
                intent: .custom(
                    verb: "format",
                    description: "Swift Style Guide")
            ),
            dependencies: [
                "SwiftFormatTool",
                "SwiftFormat",
                "SwiftLintBinary",
            ]),
        .executableTarget(
            name: "SwiftFormatTool",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ],
            resources: [
                .process("swift.swiftformat"),
                .process("swiftlint.yml"),
            ]),
        .binaryTarget(
            name: "SwiftFormat",
            url: "https://github.com/calda/SwiftFormat/releases/download/0.54-beta-5/SwiftFormat.artifactbundle.zip",
            checksum: "7447986db45a51164d23672c07f971406a4c0589b0c423fcb85e95ed8f8e7e48"),
        .binaryTarget(
            name: "SwiftLintBinary",
            url: "https://github.com/realm/SwiftLint/releases/download/0.53.0/SwiftLintBinary-macos.artifactbundle.zip",
            checksum: "03416a4f75f023e10f9a76945806ddfe70ca06129b895455cc773c5c7d86b73e"),
    ]
)

#if os(Linux)
#error("Linux is currently not supported")
#endif
