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
        //.package(url: "https://github.com/vapor/leaf", from: "4.0.0"),
        .package(url: "https://github.com/tib/leaf.git", from: "4.0.0-rc"),
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
