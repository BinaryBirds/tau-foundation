// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "leaf-foundation",
    platforms: [
       .macOS(.v11)
    ],
    products: [
        .library(name: "LeafFoundation", targets: ["LeafFoundation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/leaf", from: "4.0.0-tau"),
    ],
    targets: [
        .target(name: "LeafFoundation", dependencies: [
            .product(name: "Leaf", package: "leaf"),
        ]),
        .testTarget(name: "LeafFoundationTests", dependencies: [
            .target(name: "LeafFoundation"),
        ])
    ]
)
