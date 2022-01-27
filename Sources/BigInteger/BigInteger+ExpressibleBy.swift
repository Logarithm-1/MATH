// BigInteger+IntegerLiteral.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/NumberTheory/blob/main/LICENSE for license information

extension BigInteger: ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = Int
    
    /// Allows ``BigInteger`` to be expressed by an integer. For example:
    ///
    ///     let x: BigInteger = 5
    ///
    /// `x` would be an BigInteger with a value of `5`
    public init(integerLiteral value: Int) {
        self.init(value)
    }
}

extension BigInteger: ExpressibleByStringLiteral {
    /// A `BigUInteger` from a decimal number represented by a string literal of arbitrary length.
    /// - Requires the string to only contain decimal digits
    public init(stringLiteral value: StringLiteralType) {
        self.init(value, radix: 10)!
    }
    
    /// A `BigUInteger` from a Extended Grapheme Cluster.
    /// - Requires the string to only contain decimal digits
    public init(extendedGraphemeClusterLiteral value: String) {
        self = BigInteger(value, radix: 10)!
    }
    
    /// A `BigUInteger` from a Unicode Scalar
    /// - Requires the Scalar to represent a decimal digit.
    public init(unicodeScalarLiteral value: UnicodeScalar) {
        self = BigInteger(String(value), radix: 10)!
    }
}
