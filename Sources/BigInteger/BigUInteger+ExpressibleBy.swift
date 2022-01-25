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
