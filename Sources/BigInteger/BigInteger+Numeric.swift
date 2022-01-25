// BigInteger+Numeric.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

//MARK: - Hashable
extension BigInteger: Hashable {
    public func hash(into hasher: inout Hasher) {
        //I Don't Know
    }
}

//MARK: - Strideable
extension BigInteger: Strideable {
    //FIXME: public typealias Stride = BigInteger
    
    /// Confirms to `Strideable`
    ///
    /// Returns the distance from this value to the given value, expressed as a
    /// stride.
    ///
    /// For two values `x` and `y`, and a distance `n = x.distance(to: y)`,
    /// `x.advanced(by: n) == y`.
    ///
    /// - Parameter other: The value to calculate the distance to.
    /// - Returns: The distance from this value to `other`.
    public func distance(to other: BigInteger) -> Int {
        return 3
        //FIXME: return BigInteger(self) - BigInteger(other)
    }

    /// Confirms to `Strideable`
    ///
    /// Returns a value that is offset the specified distance from this value.
    ///
    /// Use the `advanced(by:)` method in generic code to offset a value by a
    /// specified distance. If you're working directly with numeric values, use
    /// the addition operator (`+`) instead of this method.
    ///
    /// For a value `x`, a distance `n`, and a value `y = x.advanced(by: n)`,
    /// `x.distance(to: y) == n`.
    ///
    /// - Parameter n: The distance to advance this value.
    /// - Returns: A value that is offset from this value by `n`.
    public func advanced(by n: Int) -> BigInteger {
        return self + BigInteger(n)
    }
    
    //FIXME: public func advanced(by n: BigInt) -> BigUInt {
        //return n.sign == .minus ? self - n.magnitude : self + n.magnitude
    //}
}

//MARK: - Numeric
extension BigInteger: Numeric {
    //FIXME: Not to sure what this should be. BigInteger? UInt?
    /// A type that can represent the absolute value of any possible value of this type.
    public typealias Magnitude = BigUInteger
}

//MARK: - SignedNumeric
extension BigInteger: SignedNumeric {
    /// Returns the additive inverse of the specified value.
    ///
    /// The negation operator (prefix `-`) returns the additive inverse of its
    /// argument.
    ///
    ///     let x = BigInt(21)
    ///     let y = -x
    ///     // y == -[1, 2] == -21
    ///
    /// - Returns: The additive inverse of the argument.
    prefix public static func - (operand: BigInteger) -> BigInteger {
        var result = operand
        result.negate()
        return result
    }
    
    /// Replaces this value with its additive inverse.
    ///
    /// The following example uses the `negate()` method to negate the value of
    /// an integer `x`:
    ///
    ///     var x = 21
    ///     x.negate()
    ///     // x == -21
    public mutating func negate() {
        if(sign == .plus) {
            sign = .minus
        } else {
            sign = .plus
        }
    }
    
    /// Returns the given number unchanged.
    ///
    /// You can use the unary plus operator (`+`) to provide symmetry in your
    /// code for positive numbers when also using the unary minus operator.
    ///
    ///     let x = -21
    ///     let y = +21
    ///     // x == -21
    ///     // y == 21
    ///
    /// - Returns: The given argument without any changes.
    prefix public static func + (x: BigInteger) -> BigInteger {
        return x
    }
}

//MARK: - BinaryInteger
extension BigInteger {
    public typealias Word = BigUInteger.Word
    
    /// Returns `-1` if this value is negative and `1` if it’s positive; otherwise, `0`.
    ///
    /// - Returns: The sign of this number, expressed as an integer of the same type.
    public func signum() -> BigUInteger {
        switch sign {
        case .plus:
            return isZero ? 0 : 1
        case .minus:
            return 0
        }
    }
}

//MARK: - SignedInteger
