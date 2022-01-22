// BigInteger+Hashable.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

extension BigInteger: Hashable {
    
    /// Returns a Boolean value indicating whether two values are equal
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`, `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    ///
    /// - Returns: `true` if `lhs` is equal to `rhs`
    ///
    /// This function is a requirement of the ``Hashable`` protocol.
    public static func == (lhs: BigInteger, rhs: BigInteger) -> Bool {
        //If the number of bits is different on one side compared to the other, then both sides are not equal.
        if(lhs.bitWidth != rhs.bitWidth) {
            return false
        }
        
        for index in 0..<lhs.bitWidth {
            if(lhs[index] != rhs[index]) {
                return false
            }
        }
        
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        //FIXME: I don't know what this should do.
    }
    
    
}
