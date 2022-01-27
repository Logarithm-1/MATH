// BigUInteger+Conversion.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/NumberTheory/blob/main/LICENSE for license information

//MARK: - Integer Conversion
//MARK: From BinaryInteger
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
    
    //MARK: To Int
    public func toInt() -> Int {
        if(bitWidth > 64) {
            fatalError("Cannot convert to integer at this size")
        }
        
        var result: Int = 0
        
        for (index, bit) in source.enumerated() {
            if(bit) {
                if(index == 0) {
                    result += 1
                    continue
                }
                
                var pow: Int = 1
                for _ in 0..<index {
                    pow *= 2
                }
                
                result += pow
            }
        }
                
        return result
    }
}

//MARK: - Floating Point Conversion
//MARK: From BinaryFloatingPoint
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

//MARK: to BinaryFloatingPoint
extension BinaryFloatingPoint where RawExponent: FixedWidthInteger, RawSignificand: FixedWidthInteger {
    
    //TODO: BigUInteger to BinaryFloatingPoint
    public init(_ value: BigUInteger) {
        self.init(BigInteger(sign: .plus, magnitude: value))
    }
}

//MARK: - String Conversion
//MARK: From String
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

//MARK: to String
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
        
        if(radix == 2) {
            //radix == 2
            self.init(radixTwo: v)
            return
        } else if(radix == 4) {
            self.init(radixFour: v)
            return
        } else if(radix == 8) {
            self.init(radixEight: v)
            return
        } else if(radix == 16) {
            self.init(radixSixteen: v, uppercase: uppercase)
            return
        } else if(radix == 32) {
            self.init(radixThirtyTwo: v, uppercase: uppercase)
            return
        }
        
        var str: String = ""
        
        var num: BigUInteger = v
        
        while(!num.isZero) {
            let result = num.quotientAndRemainder(dividingBy: BigUInteger(radix))
            let intRemainder: Int = result.remainder.toInt() //FIXME: I don't want to use toInt()
            str += String(intRemainder, radix: radix, uppercase: uppercase)
            num = result.quotient
        }
        
        if(str == "") {
            str += "0"
        }
        
        self = String(str.reversed())
    }
    
    /// A String that equates the the ASCII representation of a BigUInteger in binary.
    ///
    /// A quicker method then constantly divinding.
    private init(radixTwo v: BigUInteger) {
        self = ""
        
        for bit in v.source {
            self = (bit ? "1" : "0") + self
        }
    }
    
    /// A String that equates the the ASCII representation of a BigUInteger with `radix = 4`.
    ///
    /// A quicker method then constantly divinding.
    private init(radixFour v: BigUInteger) {
        self = ""
        
        var index: Int = 0
        while(index < v.bitWidth) {
            if(v[index + 1] && v[index]) {
                self = "3" + self
            } else if(v[index + 1]) {
                self = "2" + self
            } else if(v[index]) {
                self = "1" + self
            } else {
                self = "0" + self
            }
            index += 2
        }
    }
    
    /// A String that equates the the ASCII representation of a BigUInteger with `radix = 8`.
    ///
    /// A quicker method then constantly divinding.
    private init(radixEight v: BigUInteger) {
        self = ""
        
        var index: Int = 0
        while(index < v.bitWidth) {
            if(v[index + 2] && v[index + 1] && v[index]) {
                self = "7" + self
            } else if(v[index + 2] && v[index + 1]) {
                self = "6" + self
            } else if(v[index + 2] && v[index]) {
                self = "5" + self
            } else if(v[index + 2]) {
                self = "4" + self
            } else if(v[index + 1] && v[index]) {
                self = "3" + self
            } else if(v[index + 1]) {
                self = "2" + self
            } else if(v[index]) {
                self = "1" + self
            } else {
                self = "0" + self
            }
            index += 3
        }
    }
    
    /// A String that equates the the ASCII representation of a BigUInteger with `radix = 16`.
    ///
    /// A quicker method then constantly divinding.
    private init(radixSixteen v: BigUInteger, uppercase: Bool) {
        self = ""
        
        var index: Int = 0
        while(index < v.bitWidth) {
            if(v[index + 3] && v[index + 2] && v[index + 1] && v[index]) {
                self = "f" + self //15
            } else if(v[index + 3] && v[index + 2] && v[index + 1]) {
                self = "e" + self //14
            } else if(v[index + 3] && v[index + 2] && v[index]) {
                self = "d" + self //13
            } else if(v[index + 3] && v[index + 2]) {
                self = "c" + self //12
            } else if(v[index + 3] && v[index + 1] && v[index]) {
                self = "b" + self //11
            } else if(v[index + 3] && v[index + 1]) {
                self = "a" + self //10
            } else if(v[index + 3] && v[index]) {
                self = "9" + self
            } else if(v[index + 3]) {
                self = "8" + self
            } else if(v[index + 2] && v[index + 1] && v[index]) {
                self = "7" + self
            } else if(v[index + 2] && v[index + 1]) {
                self = "6" + self
            } else if(v[index + 2] && v[index]) {
                self = "5" + self
            } else if(v[index + 2]) {
                self = "4" + self
            } else if(v[index + 1] && v[index]) {
                self = "3" + self
            } else if(v[index + 1]) {
                self = "2" + self
            } else if(v[index]) {
                self = "1" + self
            } else {
                self = "0" + self
            }
            index += 4
        }
        
        if(uppercase) {
            self = self.uppercased()
        }
    }
    
    /// A String that equates the the ASCII representation of a BigUInteger with `radix = 32`.
    ///
    /// A quicker method then constantly divinding.
    private init(radixThirtyTwo v: BigUInteger, uppercase: Bool) {
        self = ""
        
        var index: Int = 0
        while(index < v.bitWidth) {
            if(v[index + 4] && v[index + 3] && v[index + 2] && v[index + 1] && v[index]) {
                self = "v" + self //31
            } else if(v[index + 4] && v[index + 3] && v[index + 2] && v[index + 1]) {
                self = "u" + self //30
            } else if(v[index + 4] && v[index + 3] && v[index + 2] && v[index]) {
                self = "t" + self //29
            } else if(v[index + 4] && v[index + 3] && v[index + 2]) {
                self = "s" + self //28
            } else if(v[index + 4] && v[index + 3] && v[index + 1] && v[index]) {
                self = "r" + self //27
            } else if(v[index + 4] && v[index + 3] && v[index + 1]) {
                self = "q" + self //26
            } else if(v[index + 4] && v[index + 3] && v[index]) {
                self = "p" + self //25
            } else if(v[index + 4] && v[index + 3]) {
                self = "o" + self //24
            } else if(v[index + 4] && v[index + 2] && v[index + 1] && v[index]) {
                self = "n" + self //23
            } else if(v[index + 4] && v[index + 2] && v[index + 1]) {
                self = "m" + self //22
            } else if(v[index + 4] && v[index + 2] && v[index]) {
                self = "l" + self //21
            } else if(v[index + 4] && v[index + 2]) {
                self = "k" + self //20
            } else if(v[index + 4] && v[index + 1] && v[index]) {
                self = "j" + self //19
            } else if(v[index + 4] && v[index + 1]) {
                self = "i" + self //18
            } else if(v[index + 4] && v[index]) {
                self = "h" + self //17
            } else if(v[index + 4]) {
                self = "g" + self //16
            } else if(v[index + 3] && v[index + 2] && v[index + 1] && v[index]) {
                self = "f" + self //15
            } else if(v[index + 3] && v[index + 2] && v[index + 1]) {
                self = "e" + self //14
            } else if(v[index + 3] && v[index + 2] && v[index]) {
                self = "d" + self //13
            } else if(v[index + 3] && v[index + 2]) {
                self = "c" + self //12
            } else if(v[index + 3] && v[index + 1] && v[index]) {
                self = "b" + self //11
            } else if(v[index + 3] && v[index + 1]) {
                self = "a" + self //10
            } else if(v[index + 3] && v[index]) {
                self = "9" + self
            } else if(v[index + 3]) {
                self = "8" + self
            } else if(v[index + 2] && v[index + 1] && v[index]) {
                self = "7" + self
            } else if(v[index + 2] && v[index + 1]) {
                self = "6" + self
            } else if(v[index + 2] && v[index]) {
                self = "5" + self
            } else if(v[index + 2]) {
                self = "4" + self
            }else if(v[index + 1] && v[index]) {
                self = "3" + self
            } else if(v[index + 1]) {
                self = "2" + self
            } else if(v[index]) {
                self = "1" + self
            } else {
                self = "0" + self
            }
            
            index += 5
        }
        
        if(uppercase) {
            self = self.uppercased()
        }
    }
}

//MARK: String Convertibles
extension BigUInteger: CustomStringConvertible {
    public var description: String {
        return String(self)
    }
}

extension BigUInteger: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "BigUInteger(size: \(bitWidth), string: \(String(self)))"
    }
}

extension BigUInteger: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        return "\(String(self)) (\(self.bitWidth) bits)"
    }
}


//MARK: - Data Conversion
extension BigUInteger {
    //MARK: From Data
    
    //MARK: To Data
}
