// BigInteger+Conversion.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/NumberTheory/blob/main/LICENSE for license information

//MARK: - Integer Conversion
//MARK: From BinaryInteger
extension BigInteger {
    /// Initializes a new signed big integer with the same value as the specified unsigned big integer.
    public init(_ integer: BigUInteger) {
        self.magnitude = integer
        self.sign = .plus
    }
    
    public init<Element: BinaryInteger>(_ source: Element) {
        if(source >= (0 as Element)) {
            self.init(sign: .plus, magnitude: BigUInteger(source))
        } else {
            self.init(sign: .minus, magnitude: BigUInteger(source * -1))
        }
    }
    
    public init?<Element: BinaryInteger>(exactly source: Element) {
        self.init(source)
    }

    public init<Element: BinaryInteger>(clamping source: Element) {
        self.init(source)
    }

    public init<Element: BinaryInteger>(truncatingIfNeeded source: Element) {
        self.init(source)
    }
    
    //MARK: To Int
    public func toInt() -> Int {
        var value: Int = magnitude.toInt()
        
        if(sign == .minus) {
            value *= -1
        }
        
        return value
    }
}

//MARK: - Floating Point Conversion
//MARK: From BinaryFloatingPoint
extension BigInteger {
    public init?<Element: BinaryFloatingPoint>(exactly source: Element) {
        switch source.sign {
        case .plus:
            guard let magnitude = BigUInteger(exactly: source) else {
                return nil
            }
            self = BigInteger(sign: .plus, magnitude: magnitude)
        case .minus:
            guard let magnitude = BigUInteger(exactly: source) else {
                return nil
            }
            self = BigInteger(sign: .minus, magnitude: magnitude)
        }
    }
    
    public init<Element: BinaryFloatingPoint>(_ source: Element) {
        self.init(exactly: source.rounded(.towardZero))!
    }
}

//MARK: To BinaryFloatingPoint
extension BinaryFloatingPoint where RawExponent: FixedWidthInteger, RawSignificand: FixedWidthInteger {
    //TODO: BigInteger to BinaryFloatingPoint
    public init(_ value: BigInteger) {
        self = 0
    }
}

//MARK: - String Conversion
//MARK: From String
extension BigInteger {
    /// A BigUInteger that equates to an ASCII representation in a given radix. Where numerals above `9` are represented by letters from the english alphabet.
    ///
    /// - Requires: `radix > 1 && radix <= 36`
    /// - Parameters:
    ///    - text: A string consisting of characters corresponding to numerals in the given radix. (0-9, a-z, A-Z)
    ///    - radix: The base of the number system to use, or 10 if unspecified.
    /// - Returns: The integer represented by `text`, or nil if `text` contains a character that does not represent a numeral in `radix`.
    public init?<S: StringProtocol>(_ text: S, radix: Int = 10) {
        var magnitude: BigUInteger?
        var sign: Sign = .plus
        if(text.first == "-") {
            sign = .minus
            let text = text.dropFirst()
            magnitude = BigUInteger(text, radix: radix)
        } else if(text.first == "+") {
            let text = text.dropFirst()
            magnitude = BigUInteger(text, radix: radix)
        } else {
            magnitude = BigUInteger(text, radix: radix)
        }
        
        guard let m = magnitude else { return nil }
        
        self.magnitude = m
        self.sign = sign
    }
}

//MARK: To String
extension String {
    /// A String that equates to the ASCII representation of a BigInteger in a given `radix`. Where numerals abobe `9` are represented by letters from the english alphabet.
    ///
    /// - Requires: `radix > 1 && radix <= 36`
    /// - Parameters:
    ///    - v: A BigUInteger.
    ///    - radix: The base of the number system to use, or `10` if unspecified.
    ///    - uppercase: The  case (`a` if false, and `A` if true) of the Numerals that represent values greater than `9`.
    public init(_ value: BigInteger, radix: Int = 10, uppercase: Bool = false) {
        self = String(value.magnitude, radix: radix, uppercase: uppercase)
        if value.sign == .minus {
            self = "-" + self
        }
    }
}

//MARK: String Convertibles
extension BigInteger: CustomStringConvertible {
    public var description: String {
        return String(self)
    }
}

extension BigInteger: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "BigUInteger(size: \(bitWidth), string: \(String(self)))"
    }
}

extension BigInteger: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        return "\(String(self)) (\(self.bitWidth) bits)"
    }
}


//MARK: - Data Conversion
extension BigUInteger {
    //MARK: From Data
    
    //MARK: To Data
}

