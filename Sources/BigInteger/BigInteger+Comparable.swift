// BigInteger+Comparable.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

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
        //IF the signs are differnet than so must the numbers
        if(lhs.negative != rhs.negative) {
            return false
        }
        
        for index in 0..<max(lhs.bitWidth, rhs.bitWidth) {
            if(lhs[index] != rhs[index]) {
                return false
            }
        }
        
        return true
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
        if(lhs.negative != rhs.negative && lhs.negative) {
            //lhs is negative and rhs is positive, thus lhs < rhs
            return true
        } else if(lhs.negative != rhs.negative) {
            //lhs is positive and rhs is negative, thus lhs > rhs.
            return false
        }
        
        //lhs.negative == rhs.negative
        if(lhs.bitWidth == rhs.bitWidth) {
            //Check
            for i in 0..<lhs.bitWidth {
                //Start from the last element in the array.
                let index: Int = lhs.bitWidth - i - 1
                
                //Since we are starting from the largest bit value (2^index), if rhs is true and lhs is false, then we can conclue that lhs < rhs
                
                if(lhs[index] != rhs[index] && rhs[index]) {
                    //lhs[index] = false, rhs[index] = true
                    //Since we are starting from the largest bit value, we can conclude that lhs < rhs (thus return true) if both lhs and rhs are positive. If they are both negative then we can conclude that lhs > rhs (thus return false).
                    return lhs.negative ? false : true
                } else if(lhs[index] != rhs[index]) {
                    //lhs = true, rhs = false
                    //Since we are starting from the largest bit value. We can conclude that lhs > rhs (thus return false) if both lhs and rhs are positive. If they are both negative then we can concluded that lhs < rhs (thus return true).
                    return lhs.negative ? true : false
                }
                
                //lhs[index] == rhs[index]
                //Cannot determine yet, go down to the next largest value.
            }
        } else if(lhs.bitWidth < rhs.bitWidth) {
            //If the lhs has lesser bitWidth we can determine that the value is also lesser than rhs, assuming that all leadding zero's (false's) are removed from array.
            return true
        }
        
        //If the lhs has greater bitWidth we can determine that the value is not lesser than rhs.
        return false
    }
}
