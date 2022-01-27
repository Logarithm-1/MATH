// BigInteger+ElementaryFunctions.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/NumberTheory/blob/main/LICENSE for license information

extension BigInteger {
    /// Returns the factorial of `self.value`
    func factorial() -> BigInteger {
        var factroial: BigInteger = 1
        
        for i in 2...self {
            factroial *= i
        }
        
        return factroial
    }
}
