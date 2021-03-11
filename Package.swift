// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "tau-foundation",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "TauFoundation", targets: ["TauFoundation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/binarybirds/tau", from: "1.0.0"),
        .package(url: "https://github.com/binarybirds/tau-kit", from: "1.0.0"),
    ],
    targets: [
        .target(name: "TauFoundation", dependencies: [
            .product(name: "Tau", package: "tau"),
            .product(name: "TauKit", package: "tau-kit"),
        ]),
        .testTarget(name: "TauFoundationTests", dependencies: [
            .target(name: "TauFoundation"),
        ])
    ]
)
