// BigInteger+Arithmetic.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

extension BigInteger: AdditiveArithmetic {
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
        switch (lhs.sign, rhs.sign) {
        case (.plus, .plus):
            return BigInteger(sign: .plus, magnitude: lhs.magnitude + rhs.magnitude)
        case (.minus, .minus):
            return BigInteger(sign: .minus, magnitude: lhs.magnitude + rhs.magnitude)
        case (.plus, .minus):
            if(lhs.magnitude >= rhs.magnitude) {
                return BigInteger(sign: .plus, magnitude: lhs.magnitude - rhs.magnitude)
            } else {
                return BigInteger(sign: .minus, magnitude: rhs.magnitude + lhs.magnitude)
            }
        case (.minus, .plus):
            if(rhs.magnitude >= lhs.magnitude) {
                return BigInteger(sign: .plus, magnitude: rhs.magnitude - lhs.magnitude)
            } else {
                return BigInteger(sign: .minus, magnitude: rhs.magnitude + rhs.magnitude)
            }
        }
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

//MARK: - Multiplication
extension BigInteger {
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
        return BigInteger(sign: (lhs.sign == rhs.sign) ? .plus : .minus, magnitude: lhs.magnitude * rhs.magnitude)
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
    
    /// Returns `true` if this value is a multiple of the given value, and false otherwise.
    ///
    /// For two integers `a` and `b`, `a` is a multiple of `b` if there exists a third integer `q` such that `a = q*b`. For example. `6` is a multiple of `3` because `6 = 2*3`. `Zero` is a mulitple of everything because `0 = 0*x` for any integer x.
    ///
    /// - Parameter other: The other value to test.
    /// - Returns A `Boolean` whether `self` is a multiple of `other`.
    public func isMultiple(of other: BigInteger) -> Bool {
        return magnitude.isMultiple(of: other.magnitude)
    }
}

//MARK: - Division and Modulus
extension BigInteger {
    /// Returns the `quotient` and `remainder` of this value (`self`) divided by the given value.
    ///
    /// Use this method to calculate the quotient and remainder of a division at the same time.
    ///
    ///     let x = 1_000_000
    ///     let (q, r) = x.quotientAndRemainder(dividingBy: 933)
    ///     // q == 1071
    ///     // r == 757
    ///
    /// - Parameter rhs: The value to divide `self` by. The `divisor`.
    /// - Returns A tuple containing the `quotient` and `remainder` of this value divided by `rhs`.
    public func quotientAndRemainder(dividingBy rhs: BigInteger) -> (quotient: BigInteger, remainder: BigInteger) {
        let (q, r) = self.magnitude.quotientAndRemainder(dividingBy: rhs.magnitude)
        return (quotient: BigInteger(sign: (sign == rhs.sign) ? .plus : .minus, magnitude: q), remainder: BigInteger(sign: .plus, magnitude: r))
    }
    
    //MARK: Division
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
    public static func /(lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        return lhs.quotientAndRemainder(dividingBy: rhs).quotient
    }
    
    /// Divides the first value by the second and stores the quotient in the
    /// left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
    public static func /=(lhs: inout BigInteger, rhs: BigInteger) {
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
    public static func %(lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        return lhs.quotientAndRemainder(dividingBy: rhs).remainder
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
    public static func %= (lhs: inout BigInteger, rhs: BigInteger) {
        lhs = lhs % rhs
    }
}

//FIXME: Change
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



extension Int {
    //MARK: - Power
    public static func ^^(lhs: Int, rhs: Int) -> Int {
        var result: Int = 1
        
        //TODO: Remove toInt()
        for _ in 0..<rhs {
            result *= lhs
        }
        
        return result
    }
}
