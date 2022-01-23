// BigInteger+IntegerLiteral.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

extension BigInteger: ExpressibleByIntegerLiteral {
    //FIXME: Not to sure what this should be. BigInteger? UInt?
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
