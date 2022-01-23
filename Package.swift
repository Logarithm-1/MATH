// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let excludedFilenames: [String] = ["README.md"]

let package = Package(
    name: "MATH",
    platforms: [
            .macOS(.v10_14), .iOS(.v13), .tvOS(.v13)
    ],
    products: [
        .library(name: "MATH", targets: ["MATH"]),
        .library(name: "BigInteger", targets: ["BigInteger"]),
        .library(name: "Matrix", targets: ["Matrix"]),
        .library(name: "ModularArithmetic", targets: ["ModularArithmetic"]),
        .library(name: "Vector", targets: ["Vector"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // MARK: - Public API
        .target(
            name: "MATH",
            dependencies: [],
            exclude: excludedFilenames),
        .target(
            name: "BigInteger",
            dependencies: [],
            exclude: excludedFilenames),
        .target(
            name: "Matrix",
            dependencies: [],
            exclude: excludedFilenames),
        .target(
            name: "ModularArithmetic",
            dependencies: [],
            exclude: excludedFilenames),
        .target(
            name: "Vector",
            dependencies: [],
            exclude: excludedFilenames),
        
        // MARK: - Unit test bundles
        .testTarget(
            name: "MATHTests",
            dependencies: ["MATH"]),
        .testTarget(
          name: "BigIntegerTests",
          dependencies: ["BigInteger"],
          exclude: excludedFilenames),
        .testTarget(
          name: "MatrixTests",
          dependencies: ["BigInteger"],
          exclude: excludedFilenames),
        .testTarget(
          name: "ModularArithmeticTests",
          dependencies: ["ModularArithmetic"],
          exclude: excludedFilenames),
        .testTarget(
          name: "VectorTests",
          dependencies: ["BigInteger"],
          exclude: excludedFilenames),
    ]
)
