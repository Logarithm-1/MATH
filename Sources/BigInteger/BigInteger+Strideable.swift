// BigInteger+Strideable.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

extension BigInteger: Strideable {
    /// Confirms to `Strideable`
    ///
    /// Returns the distance from this value to the given value, expressed as a
    /// stride.
    ///
    /// For two values `x` and `y`, and a distance `n = x.distance(to: y)`,
    /// `x.advanced(by: n) == y`.
    ///
    /// - Parameter other: The value to calculate the distance to.
    /// - Returns: The distance from this value to `other`.
    public func distance(to other: BigInteger) -> Int {
        var distance = self //- other
        //distance.negative = false

        //FIXME: Change to BigInt
        return 3//distance
    }

    /// Confirms to `Strideable`
    ///
    /// Returns a value that is offset the specified distance from this value.
    ///
    /// Use the `advanced(by:)` method in generic code to offset a value by a
    /// specified distance. If you're working directly with numeric values, use
    /// the addition operator (`+`) instead of this method.
    ///
    /// For a value `x`, a distance `n`, and a value `y = x.advanced(by: n)`,
    /// `x.distance(to: y) == n`.
    ///
    /// - Parameter n: The distance to advance this value.
    /// - Returns: A value that is offset from this value by `n`.
    public func advanced(by n: Int) -> BigInteger {
        return self //+ n
    }
}
