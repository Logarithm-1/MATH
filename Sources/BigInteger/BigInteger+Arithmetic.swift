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
    
    /// Adds two values and stores the result in the left-hand-side variable.
    ///
    /// The sum of the two arguments must be representable in the arguments' type.
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    public static func +=(lhs: inout BigInteger, rhs: BigInteger) {
        lhs = lhs + rhs
    }
    
    //MARK: - Subtraction
    /// Subtracts one value from another and produces their difference.
    ///
    /// The subtraction operator (`-`) calculates the difference of its two arguments. For example:
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
    
    /// Subtracts the second value from the first and stores the difference in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    public static func -=(lhs: inout BigInteger, rhs: BigInteger) {
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
    ///
    /// - Note: This function is a requirement of the protocol ``Numeric``
    public static func *(lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        // 1101 * 0011
        // (1101*1) + (1101*10)
        // (1101 &<< 0) + (1101 &<< 1)
        // (1101) + (11010)
        // (100111)
        var product: BigInteger = 0
        
        for i in 0..<rhs.bitWidth {
            if(rhs[i]) {
                product += lhs &<< BigInteger(i)
            }
        }
        
        return product
    }
    
    /// Multiplies two values and stores the result in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    ///
    /// - Note: This function is a requirement of the protocol ``Numeric``
    public static func *=(lhs: inout BigInteger, rhs: BigInteger) {
        lhs = lhs * rhs
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

/*
 //MARK: Divison
 /// Returns the quotient of dividing the first value by the second.
 ///
 /// For integer types, any remainder of the division is discarded.
 ///
 ///     let x = 21 / 5
 ///     // x == 4
 ///
 /// - Parameters:
 ///   - lhs: The value to divide.
 ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
 public static func / (lhs: BigInt, rhs: BigInt) -> BigInt {
     if(rhs == BigInt()) {
         //FIXME: Should be an overflow error
         return BigInt()
     }
     
     var result = BigInt()
     
     let dividend: BigInt = lhs.abs()
     let divisor: BigInt = rhs.abs()
     
     var partialDividend: BigInt = BigInt(dividend.source.last ?? 0)
     var pdIndex: Int = dividend.source.count - 2
     
     while(pdIndex >= 0) {
         while(partialDividend < divisor) {
             partialDividend.source.insert(0, at: 0)
             partialDividend += dividend.source[pdIndex]
             pdIndex -= 1
         }
     
         while(partialDividend >= divisor) {
             partialDividend -= divisor
             result += dividend.sourcePower(pdIndex + 1)
         }
     }
     
     //Negative
     result.negative = lhs.negative != rhs.negative
         
     return result
 }
 
 /// Divides the first value by the second and stores the quotient in the
 /// left-hand-side variable.
 ///
 /// - Parameters:
 ///   - lhs: The value to divide.
 ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
 public static func /= (lhs: inout BigInt, rhs: BigInt) {
     lhs = lhs / rhs
 }
 
 //MARK: Modulus
 /// Returns the remainder of dividing the first value by the second.
 ///
 /// The result of the remainder operator (`%`) has the same sign as `lhs` and
 /// has a magnitude less than `rhs.magnitude`.
 ///
 ///     let x = 22 % 5
 ///     // x == 2
 ///     let y = 22 % -5
 ///     // y == 2
 ///     let z = -22 % -5
 ///     // z == -2
 ///
 /// For any two integers `a` and `b`, their quotient `q`, and their remainder
 /// `r`, `a == b * q + r`.
 ///
 /// - Parameters:
 ///   - lhs: The value to divide.
 ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
 public static func % (lhs: BigInt, rhs: BigInt) -> BigInt {
     let dividend: BigInt = lhs.abs()
     let divisor: BigInt = rhs.abs()
     
     var partialDividend: BigInt = BigInt(dividend.source.last ?? 0)
     var pdIndex: Int = dividend.source.count - 2
     
     while(pdIndex >= 0) {
         while(partialDividend < divisor) {
             partialDividend.source.insert(0, at: 0)
             partialDividend += dividend.source[pdIndex]
             pdIndex -= 1
         }
     
         while(partialDividend >= divisor) {
             partialDividend -= divisor
         }
     }
     
     //Negative
     partialDividend.negative = lhs.negative != rhs.negative
     
     return partialDividend
 }
 
 /// Divides the first value by the second and stores the remainder in the
 /// left-hand-side variable.
 ///
 /// The result has the same sign as `lhs` and has a magnitude less than
 /// `rhs.magnitude`.
 ///
 ///     var x = 22
 ///     x %= 5
 ///     // x == 2
 ///
 ///     var y = 22
 ///     y %= -5
 ///     // y == 2
 ///
 ///     var z = -22
 ///     z %= -5
 ///     // z == -2
 ///
 /// - Parameters:
 ///   - lhs: The value to divide.
 ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
 public static func %= (lhs: inout BigInt, rhs: BigInt) {
     lhs = lhs % rhs
 }
 */

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
extension BigInteger {
    //MARK: - Power
    public static func ^^(lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        var result: BigInteger = 1
        
        //TODO: Remove toInt()
        for _ in 0..<rhs {
            result *= lhs
        }
        
        return result
    }
}
