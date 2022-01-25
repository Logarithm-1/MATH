// BigUInteger+Conversion.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

//MARK: - Integer Conversion
extension BigUInteger {
    public init<T: UnsignedInteger>(_ value: T) {
        if(value == 0) {
            self.init()
            return
        }
        
        let binary = String(value, radix: 2)
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
    
    public init?<Element: BinaryInteger>(exactly source: Element) {
        guard source >= (0 as Element) else {
            return nil //BigUInteger cannot represent negative values.
        }
        
        if let value = UInt(exactly: source) {
            self.init(value)
        } else {
            return nil
        }
    }
    
    public init<Element: BinaryInteger>(_ source: Element) {
        precondition(source >= (0 as Element), "BigUInteger cannot represent negative values.")
        self.init(exactly: source)!
    }
    
    public init<Element: BinaryInteger>(truncatingIfNeeded source: Element) {
        //FIXME: Should use source.words
        self.init(source)
    }
    
    public init<Element: BinaryInteger>(clamping source: Element) {
        if(source <= (0 as Element)) {
            //Source is negative
            self.init() //Set self to 0
        } else {
            //FIXME: Should use self.init(words: source.words)
            self.init(source)
        }
    }
}

//MARK: - Floating Point Conversion
extension BigUInteger {
    public init?<Element: BinaryFloatingPoint>(exactly source: Element) {
        guard source.isFinite else {
            //Source is Infinite
            return nil
        }
        
        guard !source.isZero else {
            //Source is zero
            self = 0
            return
        }
        
        guard source.sign == .plus else {
            //Source is negative
            return nil
        }
        
        //Round source toward zero. (23.9 -> 23)
        let value = source.rounded(.towardZero)
        
        guard value == source else {
            //source is not a integer
            return nil
        }
        
        //Makes sure that value uses the full precision of floating point type.
        assert(value.floatingPointClass == .positiveNormal)
        assert(value.exponent >= 0)
        
        let significand = value.significandBitPattern
        self = (BigUInteger(1) &<< BigUInteger(value.exponent)) + BigUInteger(significand) &>> BigUInteger(Element.significandBitCount - Int(value.exponent))
    }
    
    public init<Element: BinaryFloatingPoint>(_ source: Element) {
        self.init(exactly: source.rounded(.towardZero))!
    }
}

extension BinaryFloatingPoint where RawExponent: FixedWidthInteger, RawSignificand: FixedWidthInteger {
    
    //TODO: BigUInteger to BinaryFloatingPoint
    public init(_ value: BigUInteger) {
        self = 0
        return
    }
}

//MARK: - String Conversion
//String to BigUInteger
extension BigUInteger {
    /// A BigUInteger that equates to an ASCII representation in a given radix. Where numerals above `9` are represented by letters from the english alphabet.
    ///
    /// - Requires: `radix > 1 && radix <= 36`
    /// - Parameters:
    ///    - text: A string consisting of characters corresponding to numerals in the given radix. (0-9, a-z, A-Z)
    ///    - radix: The base of the number system to use, or 10 if unspecified.
    /// - Returns: The integer represented by `text`, or nil if `text` contains a character that does not represent a numeral in `radix`.
    public init?<S: StringProtocol>(_ text: S, radix: Int = 10) {
        precondition(radix > 1 && radix <= 36, "Radix must be between 2 and 36")
        
        self = 0
        
        //Iterate through string starting with tens (for radix = 10) place
        for digit in text {
            if let value: Int = Int(String(digit), radix: radix) {
                self *= BigUInteger(radix)
                self += BigUInteger(value)
            } else if(digit != "_" || digit != "," || digit != ".") {
                return nil
            }
        }
    }
}

//BigUInteger to String
extension String {
    /// A String that equates to the ASCII representation of a BigUInteger in a given `radix`. Where numerals abobe `9` are represented by letters from the english alphabet.
    ///
    /// - Requires: `radix > 1 && radix <= 36`
    /// - Parameters:
    ///    - v: A BigUInteger.
    ///    - radix: The base of the number system to use, or `10` if unspecified.
    ///    - uppercase: The  case (`a` if false, and `A` if true) of the Numerals that represent values greater than `9`.
    public init(_ v: BigUInteger, radix: Int = 10, uppercase: Bool = false) {
        precondition(radix > 1 && radix <= 36, "Radix must be between 2 and 36")
        
        guard !v.isZero else {
            //V == 0
            self = "0"
            return
        }
        
        var str: String = ""
        
        var num: BigUInteger = v
        
        while(!num.isZero) {
            let result = num.divided(by: BigUInteger(radix))
            let intRemainder: Int = result.remainder.toInt()
            str += String(intRemainder, radix: radix)
            num = result.quotient
        }
        
        if(str == "") {
            str += "0"
        }
        
        self = String(str.reversed())
    }
}

//MARK: - Data Conversion
