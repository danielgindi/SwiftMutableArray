// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MutableArray",
    platforms: [
          .iOS(.v11),
          .macOS(.v11),
          .tvOS(.v11),
          .watchOS(.v5)
    ],
    products: [
        .library(
            name: "MutableArray",
            targets: ["MutableArray"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "MutableArray",
            dependencies: []),
    ],
    swiftLanguageVersions: [.v5]
)
