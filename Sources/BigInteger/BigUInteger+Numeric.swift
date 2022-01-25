// BigUInteger+Numeric.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

//MARK: - Hashable
extension BigUInteger: Hashable {
    public func hash(into hasher: inout Hasher) {
        //I Don't Know
    }
}

//MARK: - Strideable
extension BigUInteger: Strideable {
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
    public func distance(to other: BigUInteger) -> BigInteger {
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
    public func advanced(by n: Int) -> BigUInteger {
        return self + BigUInteger(n)
    }
    
    //FIXME: public func advanced(by n: BigInt) -> BigUInt {
        //return n.sign == .minus ? self - n.magnitude : self + n.magnitude
    //}
}

//MARK: - Numeric
extension BigUInteger: Numeric {
    //FIXME: Not to sure what this should be. BigUInteger? UInt?
    /// A type that can represent the absolute value of any possible value of this type.
    public typealias Magnitude = BigUInteger
    
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
    public var magnitude: BigUInteger {
        return self
    }
}

//MARK: - BinaryInteger
extension BigUInteger: BinaryInteger {
    public typealias Word = UInt
    
    public struct Words: RandomAccessCollection {
        private let value: BigUInteger
        
        fileprivate init(_ value: BigUInteger) {
            self.value = value
        }
        
        public var startIndex: Int {
            return 0
        }
        
        public var endIndex: Int {
            return (value.source.count / 512) + 1
        }
        
        public subscript(_ index: Int) -> Word {
            return value[byte64: index]
        }
    }
    
    public var words: Words {
        return Words(self)
    }
    
    //TODO: init(words)
    
    /// Returns `-1` if this value is negative and `1` if it’s positive; otherwise, `0`.
    ///
    /// - Returns: The sign of this number, expressed as an integer of the same type.
    public func signum() -> BigUInteger {
        if(isZero) {
            return 0
        }
        
        return 1
    }
}

//MARK: - UnsignedInteger
extension BigUInteger: UnsignedInteger {}
