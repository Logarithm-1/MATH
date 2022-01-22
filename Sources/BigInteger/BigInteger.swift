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
        self.init(source: [false])
    }
    
    /// A BigInteger constructed by specifying the reverse of the source array (so that it would be read left-right correctly).
    ///
    /// Equivalent to `BigInteger(source.reversed(), false)`.
    public init(reversed source: [Bool]) {
        self.init(source: source.reversed())
    }
    
    /// A BigInteger that equates to a unsigned integer.
    ///
    /// Equivalent to `BigInteger(num, false)`.
    public init(_ num: UInt) {
        if(num == 0) {
            self.init()
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
        
        self.init(source: source)
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
            if(index < 0 || index > bitWidth) {
                return false
            }
            
            return source[index]
        } set(newValue) {
            //If the newValue is `false` (0) and it would be placed in the front of the array (as a leading zero) then don't bother with it.
            if(newValue == false && source.count < index) {
                return
            }
            
            //If the index is out of range then don't do anything.
            if(index > upperLimit) {
                return
            }
            
            //If the newValue is going on an index that does not exist, keep adding zeros to the array until it does.
            while(source.count < index) {
                source.append(false)
            }
            
            //If
            source[index] = newValue
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
}

