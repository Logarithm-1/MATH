// BigUInteger+Comparable.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/NumberTheory/blob/main/LICENSE for license information

extension BigUInteger: Equatable {
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
    public static func == (lhs: BigUInteger, rhs: BigUInteger) -> Bool {
        for index in 0..<Swift.max(lhs.bitWidth, rhs.bitWidth) {
            if(lhs[index] != rhs[index]) {
                return false
            }
        }
        
        return true
    }
}
    
extension BigUInteger: Comparable {
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
    public static func < (lhs: BigUInteger, rhs: BigUInteger) -> Bool {
        for i in 0..<Swift.max(lhs.bitWidth, rhs.bitWidth) {
            //Start from the last element in the array.
            let index: Int = Swift.max(lhs.bitWidth, rhs.bitWidth) - i - 1
            
            //Since we are starting from the largest bit value (2^index), if rhs is true and lhs is false, then we can conclue that lhs < rhs
            
            if(lhs[index] != rhs[index] && rhs[index]) {
                //lhs[index] = false, rhs[index] = true
                //Since we are starting from the largest bit value, we can conclude that lhs < rhs (thus return true)
                return true
            } else if(lhs[index] != rhs[index]) {
                //lhs = true, rhs = false
                //Since we are starting from the largest bit value. We can conclude that lhs > rhs (thus return false)
                return false
            }
            
            //lhs[index] == rhs[index]
            //Cannot determine yet, go down to the next largest value.
        }
        
        return false
    }
}
