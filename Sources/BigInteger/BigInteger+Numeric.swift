// BigInteger+Numeric.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/NumberTheory/blob/main/LICENSE for license information

//MARK: - Hashable
extension BigInteger: Hashable {
    public func hash(into hasher: inout Hasher) {
        //I Don't Know
    }
}

//MARK: - Strideable
extension BigInteger: Strideable {
    public typealias Stride = BigInteger
    
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
    public func distance(to other: BigInteger) -> Stride {
        return other - self
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
    public func advanced(by n: Stride) -> BigInteger {
        return self + n
    }
}

//MARK: - Numeric
extension BigInteger: Numeric {
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
        guard !magnitude.isZero else {
            return
        }
        self.sign = (self.sign == .plus) ? .minus : .plus
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
extension BigInteger: BinaryInteger {
    public typealias Word = BigUInteger.Word
    
    public struct Words: RandomAccessCollection {
        public typealias Indices = CountableRange<Int>
        
        private let value: BigInteger
        private let decrementLimit: Int
        
        fileprivate init(_ value: BigInteger) {
            self.value = value
            switch value.sign {
            case .plus:
                self.decrementLimit = 0
            case .minus:
                assert(!value.magnitude.isZero)
                self.decrementLimit = value.magnitude.words.firstIndex(where: {$0 != 0})!
            }
        }
        
        public var count: Int {
            switch value.sign {
            case .plus:
                if let high = value.magnitude.words.last,
                   high >> (Word.bitWidth - 1) != 0 {
                    return value.magnitude.count + 1
                }
                return value.magnitude.count
            case .minus:
                let high = value.magnitude.words.last!
                if(high >> (Word.bitWidth - 1) != 0) {
                    return value.magnitude.count + 1
                }
                return value.magnitude.count
            }
        }
        
        public var startIndex: Int {
            return 0
        }
        
        public var endIndex: Int {
            return count
        }
        
        public var indices: Indices {
            return 0 ..< count
        }
        
        public subscript(_ index: Int) -> UInt {
            // Note that indices above `endIndex` are accepted.
            if value.sign == .plus {
                return value.magnitude[byte64: index]
            }
            if index <= decrementLimit {
                return ~(value.magnitude[byte64: index] &- 1)
            }
            return ~value.magnitude[byte64: index]
        }
    }
    
    public var words: Words {
        return Words(self)
    }
    
    //TODO: init(words)
}

//MARK: - SignedInteger
extension BigInteger: SignedInteger {
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
