// ModularArithmetic.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

/// A type that adds a modulus to integers.
public protocol Modular: SignedInteger {}


extension Modular {
    public func mod(_ base: Self) -> Self {
        return 0
    }
    
    public func divided(by divisor: Self, base: Self) -> Self {
        return 0
    }
    
    public func power(of power: Self) -> Self {
        return 0
    }
    
    public func inversePower(of power: Self) -> Self {
        return 0
    }
}
