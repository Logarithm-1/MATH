// BigInteger.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information
//
//

import Darwin

//TODO: Ranges?

/// An integer with the max-limit of at least 1,000 bits.
///
/// TODO: Figure out the max-limit of bits
public struct BigInteger {
    /// An array of bits (Boolean's) representing the value of an integer.
    ///
    /// The first bit in the array is an boolean that represents the "one's" place. The second element in the array represents the "two's", where the third represents "four's" and so on.
    ///
    ///     source = [0, 0, 1, 1, 1, 0, 1, 0]
    ///     //Which would normally look like 0101 1100 or 92
    ///
    /// So the array would be read in rervse.
    internal var source: [Bool]
    
    /// A Boolean where if `true` the BigInteger is negative and if `false` it is positve.
    internal var negative: Bool
    
    /// The maxiumn size of the array (ie. how many bits the integer can use)
    internal var upperLimit: Int = 1000
    
    /// A BigInteger constructed by specifying the source array.
    public init(source: [Bool], negative: Bool = false) {
        self.source = source
        self.negative = negative
    }
}

//MARK: - Additional Initializers
extension BigInteger {
    /// A BigInteger that equates to zero.'
    ///
    /// Equivalent to `BigInteger([false], false)`.
    public init() {
        let source: [Bool] = [false]
        self.init(source: source, negative: false)
    }
    
    /// A BigInteger constructed by specifying the reverse of the source array (so that it would be read left-right correctly).
    ///
    /// Equivalent to `BigInteger(source.reversed(), false)`.
    public init(reversed source: [Bool], negative: Bool = false) {
        self.init(source: source.reversed(), negative: negative)
    }
    
    /// A BigInteger that equates to a unsigned integer.
    ///
    /// Equivalent to `BigInteger(num, false)`.
    public init<T: UnsignedInteger>(_ num: T, negative: Bool = false) {
        if(num == 0) {
            self.init()
            return
        } else if(num == 1) {
            self.init(source: [true])
            return
        }
        
        let binary = String(num, radix: 2)
        var source: [Bool] = [Bool]()
        
        for bit in binary.reversed() {
            if(bit == "1") {
                source.append(true)
            } else {
                source.append(false)
            }
        }
        
        // Should never be run, since the only possible way for source to have a count of zero is if UInt is 0 and we ruled that option out already.
        if(source.count == 0) {
            self.init()
        }
        
        self.init(source: source, negative: negative)
    }
    
    /// A BigInteger that equates to a signed integer.
    ///
    /// Equivalent to `BigInteger(num, num < 0)`.
    public init<T: SignedInteger>(_ num: T) {
        if(num >= 0) {
            self.init(UInt(num), negative: false)
        } else {
            self.init(UInt(-num), negative: true)
        }
    }
    
    //TODO: Integer String
    /// A BigInteger that equates to an Integer String.
    public init(_ stringInt: String) {
        self.init()
    }
}

// MARK: - Basic properties
extension BigInteger {
    public var bitWidth: Int {
        return source.count
    }
    
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
            if(index > upperLimit) {
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
    
    public mutating func removeTrailingZeros() {
        for index in 0..<bitWidth {
            if(index == 0) {
                break
            }
            
            if(!source[bitWidth - index - 1]) {
                source.removeLast()
            } else {
                break
            }
        }
        
        if(bitWidth == 0) {
            self[0] = false
        }
    }
    
    public func toString() -> String {
        var str: String = ""
        
        for (_, bit) in source.reversed().enumerated() {
            if(bit) {
                str += "1"
            } else {
                str += "0"
            }
        }
        
        return str
    }
    
    public func toString(radix: Int = 10) -> String {
        var str: String = ""
        
        var num: BigInteger = self
        
        while(num > 0) {
            let result = num.divided(by: 10)
            str += result.remainder._toString()
            num = result.remainder
        }
        
        return String(str)
    }
    
    private func _toString() -> String {
        return String(toInt())
    }
    
    public func toInt() -> Int {
        if(bitWidth > 64) {
            fatalError("Cannot convert to integer at this size")
        }
        
        var result: Int = 0
        
        for (index, bit) in source.enumerated() {
            if(bit) {
                result += Int(pow(2.0, Double(index)))
            }
        }
        
        if(negative) {
            result *= -1
        }
        
        return result
    }
}

