// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-leetcode-playground",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .executable(
            name: "swift-leetcode-playground",
            targets: ["swift-leetcode-playground"]
        ),
        .executable(
            name: "LeetcodeAPI",
            targets: ["LeetcodeAPI"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Get", from: "1.0.2"),
    ],
    targets: [
        .executableTarget(name: "swift-leetcode-playground"),
        .executableTarget(
            name: "LeetcodeAPI",
            dependencies: [
                .product(name: "Get", package: "Get"),
            ]
        ),
    ]
)
