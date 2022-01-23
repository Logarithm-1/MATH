// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let excludedFilenames: [String] = ["README.md"]

//TODO: Add a all incopassing Libary ("MATH")

let package = Package(
    name: "MATH",
    platforms: [
            .macOS(.v10_14), .iOS(.v13), .tvOS(.v13)
    ],
    products: [
        .library(name: "BigInteger", targets: ["BigInteger"]),
        .library(name: "Constants", targets: ["Constants"]),
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
            name: "BigInteger",
            dependencies: [],
            exclude: excludedFilenames),
        .target(
            name: "Constants",
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
          name: "BigIntegerTests",
          dependencies: ["BigInteger"]),
        .testTarget(
          name: "ConstantsTests",
          dependencies: ["Constants"]),
        .testTarget(
          name: "MatrixTests",
          dependencies: ["Matrix"]),
        .testTarget(
          name: "ModularArithmeticTests",
          dependencies: ["ModularArithmetic"]),
        .testTarget(
          name: "VectorTests",
          dependencies: ["Vector"]),
    ]
)
