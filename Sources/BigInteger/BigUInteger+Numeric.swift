// BigUInteger+Numeric.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

//MARK: - Numeric
extension BigUInteger: Numeric {
    //FIXME: Not to sure what this should be. BigUInteger? UInt?
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
        if let value = UInt(exactly: source) {
            self.init(value)
        } else {
            return nil
        }
    }
}
