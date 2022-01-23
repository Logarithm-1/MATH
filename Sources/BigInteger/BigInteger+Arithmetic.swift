// BigInteger+Arithmetic.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

extension BigInteger: AdditiveArithmetic {
    public static var zero: BigInteger {
        return BigInteger()
    }
    
    //MARK: - Addition
    /// Adds two values and produces their sum.
    ///
    /// The addition operator (`+`) calculates the sum of its two arguments. For
    /// example:
    ///
    ///     1 + 2                   // 3
    ///     -10 + 15                // 5
    ///     -15 + -5                // -20
    ///     21.5 + 3.25             // 24.75
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    /// - Returns: The sum of two values, `lhs` and `rhs`
    public static func +(lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        let and: BigInteger = (lhs & rhs) &<< 1
        let xor: BigInteger = lhs ^ rhs
        
        if(and.toInt() == 0) {
            return xor
        }
            
        return and + xor
    }
    
    /// Adds two values and produces their sum.
    public static func +<T: SignedInteger>(lhs: BigInteger, rhs: T) -> BigInteger {
        return lhs + BigInteger(rhs)
    }
    
    /// Adds two values and produces their sum.
    public static func +<T: SignedInteger>(lhs: T, rhs: BigInteger) -> BigInteger {
        return BigInteger(lhs) + rhs
    }
    
    /// Adds two values and produces their sum.
    public static func +<T: UnsignedInteger>(lhs: BigInteger, rhs: T) -> BigInteger {
        return lhs + BigInteger(rhs)
    }
    
    /// Adds two values and produces their sum.
    public static func +<T: UnsignedInteger>(lhs: T, rhs: BigInteger) -> BigInteger {
        return BigInteger(lhs) + rhs
    }
    
    /// Adds two values and stores the result in the left-hand-side variable.
    ///
    /// The sum of the two arguments must be representable in the arguments'
    /// type.
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    public static func += (lhs: inout BigInteger, rhs: BigInteger) {
        lhs = lhs + rhs
    }
    
    /// Adds two values and stores the result in the left-hand-side variable.
    public static func +=<T: SignedInteger>(lhs: inout BigInteger, rhs: T) {
        lhs = lhs + rhs
    }
    
    /// Adds two values and stores the result in the left-hand-side variable.
    public static func +=<T: UnsignedInteger>(lhs: inout BigInteger, rhs: T) {
        lhs = lhs + rhs
    }
    
    //MARK: - Subtraction
    public static func -(lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        return BigInteger()
    }
}

extension BigInteger {
    //MARK: - Multiplication
    public static func *(lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        return BigInteger()
    }
    
    //MARK: - Division
    public static func /(lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        return BigInteger()
    }
    
    //MARK: - Modulus
    public static func %(lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        return BigInteger()
    }
}

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
extension BigInteger {
    //MARK: - Power
    public static func ^^(lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        return BigInteger()
    }
}
