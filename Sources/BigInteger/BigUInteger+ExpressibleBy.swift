// BigUInteger+ExpressibleBy.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

extension BigUInteger: ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = UInt
    
    public init(integerLiteral value: UInt) {
        self.init(value)
    }
}

//TODO: ExpressibleByStringLiteral
extension BigUInteger: ExpressibleByStringLiteral {
    /// A `BigUInteger` from a decimal number represented by a string literal of arbitrary length.
    /// - Requires the string to only contain decimal digits
    public init(stringLiteral value: StringLiteralType) {
        self.init(value, radix: 10)!
    }
    
    /// A `BigUInteger` from a Extended Grapheme Cluster.
    /// - Requires the string to only contain decimal digits
    public init(extendedGraphemeClusterLiteral value: String) {
        self = BigUInteger(value, radix: 10)!
    }
    
    /// A `BigUInteger` from a Unicode Scalar
    /// - Requires the Scalar to represent a decimal digit.
    public init(unicodeScalarLiteral value: UnicodeScalar) {
        self = BigUInteger(String(value), radix: 10)!
    }
}
