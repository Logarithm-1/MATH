// BigInteger+Comparable.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/NumberTheory/blob/main/LICENSE for license information

extension BigInteger: Equatable {
    //MARK: - Equal
    /// Returns a Boolean value indicating whether two values are equal
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`, `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    ///
    /// - Returns: `true` if `lhs` is equal to `rhs`
    public static func == (lhs: BigInteger, rhs: BigInteger) -> Bool {
        if(lhs.sign == rhs.sign) {
            return lhs.magnitude == rhs.magnitude
        }
        return false
    }
}
    
extension BigInteger: Comparable {
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    ///
    /// - Returns: `true` if `lhs` is lesser than `rhs`
    public static func < (lhs: BigInteger, rhs: BigInteger) -> Bool {
        switch (lhs.sign, rhs.sign) {
        case (.plus, .plus):
            return lhs.magnitude < rhs.magnitude
        case (.minus, .minus):
            return lhs.magnitude > rhs.magnitude
        case (.plus, .minus):
            return false
        case (.minus, .plus):
            return true
        }
    }
}
