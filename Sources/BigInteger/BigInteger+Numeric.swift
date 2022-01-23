// BigInteger+Numeric.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

//MARK: - Numeric
extension BigInteger: Numeric {
    //FIXME: Not to sure what this should be. BigInteger? UInt?
    /// A type that can represent the absolute value of any possible value of this type.
    public typealias Magnitude = UInt
    
    /// The magnitude of this value.
    ///
    /// For any numeric value `x`, `x.magnitude` is the absolute value of `x`.
    /// You can use the `magnitude` property in operations that are simpler to
    /// implement in terms of unsigned values, such as printing the value of an
    /// integer, which is just printing a '-' character in front of an absolute
    /// value.
    ///
    ///     let x = -200
    ///     // x.magnitude == 200
    ///
    /// The global `abs(_:)` function provides more familiar syntax when you need
    /// to find an absolute value. In addition, because `abs(_:)` always returns
    /// a value of the same type, even in a generic context, using the function
    /// instead of the `magnitude` property is encouraged.
    public var magnitude: UInt {
        get {
            return UInt(toInt())
        } set {
            //TODO: set
        }
    }
    
    public init?<T>(exactly source: T) where T : BinaryInteger {
        if let value = Int(exactly: source) {
            self.init(value)
        } else {
            return nil
        }
    }
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
        negative.toggle()
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
