// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "leaf-foundation",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "LeafFoundation", targets: ["LeafFoundation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/leaf", .exact("4.0.0-tau.1")),
        .package(url: "https://github.com/vapor/leaf-kit", .exact("1.0.0-tau.1.1")),
    ],
    targets: [
        .target(name: "LeafFoundation", dependencies: [
            .product(name: "Leaf", package: "leaf"),
            .product(name: "LeafKit", package: "leaf-kit"),
        ]),
        .testTarget(name: "LeafFoundationTests", dependencies: [
            .target(name: "LeafFoundation"),
        ])
    ]
)
