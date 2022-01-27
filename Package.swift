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
        .library(name: "BigInteger", targets: ["BigInteger"]),
        .library(name: "ModularArithmetic", targets: ["ModularArithmetic"]),
        .library(name: "NumberTheory", targets: ["NumberTheory"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        //MARK: - Public API
        .target(
            name: "BigInteger",
            dependencies: [],
            exclude: excludedFilenames),
        .target(
            name: "IntegerUtilities",
            dependencies: [],
            exclude: excludedFilenames),
        .target(
            name: "ModularArithmetic",
            dependencies: ["IntegerUtilities"],
            exclude: excludedFilenames),
        .target(
            name: "NumberTheory",
            dependencies: ["BigInteger", "IntegerUtilities", "ModularArithmetic"],
            exclude: excludedFilenames),
        
        // MARK: - Unit test bundles
        .testTarget(
            name: "BigIntegerTests",
            dependencies: ["BigInteger"]),
        .testTarget(
            name: "NumberTheoryTests",
            dependencies: ["NumberTheory"]),
        .testTarget(
            name: "ModularArithmeticTests",
            dependencies: ["ModularArithmetic"]),
    ]
)
