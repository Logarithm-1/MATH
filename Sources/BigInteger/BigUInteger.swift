// BigUInteger.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/NumberTheory/blob/main/LICENSE for license information

/// An unsigned integer type with arbitary precision know as a "big integer"
///
/// The pros of using big integers is that they never overflow.
/// The cons is that thye may take a long time to execute.
///
/// This partcular big integer type uses booleans to represent bits.
public struct BigUInteger {
    /// An array of bits (Boolean's) representing the value of an integer.
    ///
    /// The first bit in the array is an boolean that represents the "one's" place. The second element in the array represents the "two's", where the third represents "four's" and so on.
    ///
    ///     source = [0, 0, 1, 1, 1, 0, 1, 0]
    ///     //Which would normally look like 0101 1100 or 92
    ///
    /// So the array would be read in rervse.
    internal var source: [Bool]
    
    /// The maxiumn size of the array (ie. how many bits the integer can use)
    internal var upperLimit: Int = 1_000_000
    
    /// A BigInteger constructed by specifying the source array.
    public init(source: [Bool]) {
        self.source = source
    }
}

//MARK: - Additional Initializers
extension BigUInteger {
    /// A BigInteger that equates to zero.'
    ///
    /// Equivalent to `BigInteger([false])`.
    public init() {
        self.init(source: [false])
    }
    
    /// A BigInteger constructed by specifying the reverse of the source array (so that it would be read left-right correctly).
    ///
    /// Equivalent to `BigInteger(source.reversed())`.
    public init(reversed source: [Bool]) {
        self.init(source: source.reversed())
    }
}

//MARK: - Basic Properties
extension BigUInteger {
    /// The number of bits in the current binary representation of this value.
    public var bitWidth: Int {
        return source.count
    }
    
    /// A Boolean value indicating whether this type is a signed integer type.
    ///
    /// Signed integer types can represent both positive and negative values. Unsigned integer types can represent only nonnegative values.
    public static var isSigned: Bool {
        return false
    }
    
    /// The number of trailing zeros in this value’s binary representation.
    ///
    /// Thus how many trailingZero's in soruce
    public var trailingZeroBitCount: Int {
        var count: Int = 0
        
        for bit in source.reversed() {
            if(!bit) {
                count += 1
            } else {
                break
            }
        }
        
        return count
    }
    
    /// Return `true` iff this integer is zero.
    public var isZero: Bool {
        return (self == 0)
    }
    
    public static var zero: BigUInteger {
        return BigUInteger()
    }
    
    /// The number of digits in this integer, excluding leading zero digits.
    var count: Int {
        return source.count
    }
}

//MARK: - Getters and Setters
extension BigUInteger {
    public subscript(index: Int) -> Bool {
        get {
            //If the index is outOfRange of the array, return zero.
            if(index < 0 || index >= bitWidth) {
                return false
            }
            
            return source[index]
        } set(newValue) {
            //If the newValue is `false` (0) and it would be placed in the front of the array (as a leading zero) then don't bother with it.
            if(newValue == false && index >= bitWidth) {
                return
            }
            
            //If the index is out of range then don't do anything.
            if(index > upperLimit || index < 0) {
                return
            }
            
            //If the newValue is going on an index that does not exist, keep adding zeros to the array until it does.
            while(index >= bitWidth) {
                source.append(false)
            }
            
            //Index should be in range of source now, so should be good to set the value.
            source[index] = newValue
        }
    }
    
    /// `{get set}` a  `byte` of self in the form of a ``UInt8``.
    public subscript(byte index: Int) -> UInt8 {
        get {
            var value: UInt8 = 0
            
            let minIndex: Int = index * 8
            
            for i in 0..<8 {
                if(self[minIndex + i]) {
                    value += (1 << i)
                }
            }
            
            return value
        } set(newValue) {
            var value: UInt8 = newValue
            
            let minIndex: Int = index * 8
            
            for i in 0..<8 {
                if(value & 1 == 1) {
                    self[minIndex + i] = true
                } else {
                    self[minIndex + i] = false
                }
                
                value >>= 1
            }
        }
    }
    
    public subscript(byte64 index: Int) -> UInt {
        get {
            var value: UInt = 0
            
            let minIndex: Int = index * 512
            
            for i in 0..<512 {
                if(self[minIndex + i]) {
                    value += (1 << i)
                }
            }
            
            return value
        } set(newValue) {
            var value: UInt = newValue
            
            let minIndex: Int = index * 512
            
            for i in 0..<512 {
                if(value & 1 == 1) {
                    self[minIndex + i] = true
                } else {
                    self[minIndex + i] = false
                }
                
                value >>= 1
            }
        }
    }
}


