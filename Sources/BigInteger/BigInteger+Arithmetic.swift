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
    /// The addition operator (`+`) calculates the sum of its two arguments. For example:
    ///
    ///     1 + 2                   // 3
    ///     -10 + 15                // 5
    ///     -15 + -5                // -20
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    /// - Returns: The sum of two values, `lhs` and `rhs`
    public static func +(lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        //If lhs and rhs have the same sign (are both positive or both negative) add like normal and keep the sign
        if(lhs.negative == rhs.negative) {
            let and: BigInteger = (lhs & rhs) &<< 1
            let xor: BigInteger = lhs ^ rhs
            
            if(and.toInt() == 0) {
                return xor
            }
                
            return and + xor
        }
        //TODO: lhs and rhs don't have the same sign
        
        return BigInteger()
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
    /// The sum of the two arguments must be representable in the arguments' type.
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
    /// Subtracts one value from another and produces their difference.
    ///
    /// The subtraction operator (`-`) calculates the difference of its two
    /// arguments. For example:
    ///
    ///     8 - 3                   // 5
    ///     -10 - 5                 // -15
    ///     100 - -5                // 105
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    public static func -(lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        return lhs + (-rhs)
    }
    
    /// Subtracts one value from another and produces their difference.
    public static func -<T: SignedInteger>(lhs: BigInteger, rhs: T) -> BigInteger {
        return lhs - BigInteger(rhs)
    }
    
    /// Subtracts one value from another and produces their difference.
    public static func -<T: SignedInteger>(lhs: T, rhs: BigInteger) -> BigInteger {
        return BigInteger(lhs) - rhs
    }
    
    /// Subtracts one value from another and produces their difference.
    public static func -<T: UnsignedInteger>(lhs: BigInteger, rhs: T) -> BigInteger {
        return lhs - BigInteger(rhs)
    }
    
    /// Subtracts one value from another and produces their difference.
    public static func -<T: UnsignedInteger>(lhs: T, rhs: BigInteger) -> BigInteger {
        return BigInteger(lhs) - rhs
    }
    
    /// Subtracts the second value from the first and stores the difference in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    public static func -= (lhs: inout BigInteger, rhs: BigInteger) {
        lhs = lhs - rhs
    }
    
    /// Subtracts the second value from the first and stores the difference in the left-hand-side variable.
    public static func -=<T: SignedInteger>(lhs: inout BigInteger, rhs: T) {
        lhs = lhs - rhs
    }
    
    /// Subtracts the second value from the first and stores the difference in the left-hand-side variable.
    public static func -=<T: UnsignedInteger>(lhs: inout BigInteger, rhs: T) {
        lhs = lhs - rhs
    }
}

extension BigInteger {
    //MARK: - Multiplication
    /// Multiplies two values and produces their product.
    ///
    /// The multiplication operator (`*`) calculates the product of its two
    /// arguments. For example:
    ///
    ///     2 * 3                   // 6
    ///     100 * 21                // 2100
    ///     -10 * 15                // -150
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    public static func *(lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        // 1101 * 0011
        // (1101*1) + (1101*10)
        // (1101 &<< 0) + (1101 &<< 1)
        // (1101) + (11010)
        // (100111)
        var product: BigInteger = BigInteger() //= 0
        
        for i in 0..<rhs.bitWidth {
            if(rhs[i]) {
                product += lhs &<< i
            }
        }
        
        return product
    }
    
    /// Multiplies two values and produces their product.
    public static func *<T: SignedInteger>(lhs: BigInteger, rhs: T) -> BigInteger {
        return lhs * BigInteger(rhs)
    }
    
    /// Multiplies two values and produces their product.
    public static func *<T: SignedInteger>(lhs: T, rhs: BigInteger) -> BigInteger {
        return BigInteger(lhs) * rhs
    }
    
    /// Multiplies two values and produces their product.
    public static func *<T: UnsignedInteger>(lhs: BigInteger, rhs: T) -> BigInteger {
        return lhs * BigInteger(rhs)
    }
    
    /// Multiplies two values and produces their product.
    public static func *<T: UnsignedInteger>(lhs: T, rhs: BigInteger) -> BigInteger {
        return BigInteger(lhs) * rhs
    }
    
    /// Multiplies two values and stores the result in the left-hand-side
    /// variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    public static func *=(lhs: inout BigInteger, rhs: BigInteger) {
        lhs = lhs * rhs
    }
    
    /// Multiplies two values and stores the result in the left-hand-side
    /// variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    public static func *=<T: SignedInteger>(lhs: inout BigInteger, rhs: T) {
        lhs = lhs * BigInteger(rhs)
    }
    
    /// Multiplies two values and stores the result in the left-hand-side
    /// variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    public static func *=<T: UnsignedInteger>(lhs: inout BigInteger, rhs: T) {
        lhs = lhs * BigInteger(rhs)
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
        var result: BigInteger = BigInteger(1) //= 1
        
        //TODO: Remove toInt()
        for _ in 0..<rhs.toInt() {
            result *= lhs
        }
        
        return result
    }
}
