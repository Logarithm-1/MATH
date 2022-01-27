// BigInteger.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/NumberTheory/blob/main/LICENSE for license information

/// A signed integer type with arbitary precision know as a "big integer"
///
/// The pros of using big integers is that they never overflow.
/// The cons is that thye may take a long time to execute.
///
/// This partcular big integer type uses booleans to represent bits.
public struct BigInteger {
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
    public var magnitude: BigUInteger
    
    /// The sign of this value. Positive or negative.
    public var sign: Sign
    
    /// A BigInteger constructed by specifying the source array.
    public init(sign: Sign, magnitude: BigUInteger) {
        self.magnitude = magnitude
        self.sign = sign
    }
}

//MARK: - Additional Initializers
extension BigInteger {
    /// A BigInteger that equates to zero.'
    ///
    /// Equivalent to `BigInteger(sign: .plus, magnitude: 0)`.
    public init() {
        self.init(sign: .plus, magnitude: BigUInteger())
    }
    
    /// A BigInteger constructed by specifying the reverse of the source array (so that it would be read left-right correctly).
    ///
    /// Equivalent to `BigInteger(sign: .plus, magnitude: BigUInteger(source: source))`.
    public init(reversed source: [Bool], sign: Sign = .plus) {
        self.init(sign: .plus, magnitude: BigUInteger(source: source))
    }
    
    /// A BigInteger constructed by specifying the reverse of the source array (so that it would be read left-right correctly).
    ///
    /// Equivalent to `BigInteger(sign: .plus, magnitude: BigUInteger(reversed: source))`.
    public init(reversed source: [Bool], negative: Bool = false) {
        self.init(sign: .plus, magnitude: BigUInteger(reversed: source))
    }
}

// MARK: - Basic properties
extension BigInteger {
    /// The number of bits in the current binary representation of this value.
    public var bitWidth: Int {
        return magnitude.bitWidth
    }
    
    /// A Boolean value indicating whether this type is a signed integer type.
    ///
    /// Signed integer types can represent both positive and negative values. Unsigned integer types can represent only nonnegative values.
    public static var isSigned: Bool {
        return true
    }
    
    /// The number of trailing zeros in this value’s binary representation.
    ///
    /// Thus how many trailingZero's in soruce
    public var trailingZeroBitCount: Int {
        return magnitude.trailingZeroBitCount
    }
    
    /// Return `true` iff this integer is zero.
    public var isZero: Bool {
        return magnitude.isZero
    }
    
    public static var zero: BigInteger {
        return BigInteger()
    }
}

//MARK: - Getters and Setters
extension BigInteger {
    public subscript(index: Int) -> Bool {
        get {
            magnitude[index]
        } set(newValue) {
            magnitude[index] = newValue
        }
    }
}

