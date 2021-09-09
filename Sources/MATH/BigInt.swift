//
//  BigInt.swift
//  Math
//
//  Created by Logan Richards on 8/26/21.
//

import Foundation

//TODO: Random
//TODO: Conform BigInt to BinaryInteger
    //TODO: Add Words
//TODO: Conform BigInt to FixedWidthIntegerger
//TODO: Conform BigInt to SignedNumeric
//TODO: Conform BigInt to SignedInteger
//TODO: Documentation
//TODO: Math Functions (That can't act as a nomral Int)

/// A Integer that can be hundreds of digits long
public struct BigInt: LosslessStringConvertible, Hashable, Numeric, Strideable {
    public typealias Words = Int

    //FIXME: Magnitude should be a BigInt
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
    public var magnitude: Int = 0
    
    /// A type that can represent the absolute value of any possible value of
    /// this type.
    public typealias Magnitude = Int
    

    /// A type that represents an integer literal.
    //FIXME: Should be `public typealias IntegerLiteralType = BigInt`
    public typealias IntegerLiteralType = Int
    
    
    public static var zero: BigInt = BigInt(0)
    
    //SignedInteger
    
    /// The first element in array is an integer that represents the ones place
    /// The secound elemnts in array is an integer that represents the tens place
    ///
    ///     let x: Int = 12,345,678
    ///     let y: BigInt = BigInt(x)
    ///     //y == [8, 7, 6, 5, 4, 3, 2, 1] == 12,345,678
    ///
    /// So it is like the arry is reversed
    var source: [Int]
    var negative: Bool = false
    
    public var description: String {
        return toString()
    }
    
    //MARK: - Initializers
    init() {
        self.source = [0]
    }
    
    public init(_ source: Int) {
        self.source = [source]
        self.reArangeArray()
    }
    
    public init(_ source: [Int]) {
        self.source = source
        self.reArangeArray()
    }
    
    init(reversed source: [Int]) {
        self.source = source.reversed()
        self.reArangeArray()
    }
    
    /// This initializer is a requirement of the `AdditiveArithmetic` protocol.
    public init(integerLiteral value: Int) {
        self.source = [value]
        self.reArangeArray()
    }
    
    /// This initializer is a requirement of the `Numeric` protocol.
    public init?<T>(exactly source: T) where T : BinaryInteger {
        self.source = [Int(exactly: source) ?? 0]
        self.reArangeArray()
    }
    
    //FIXME: This Init
    /// This initializer is a requirement of the `LosslessStringConvertible` protocol.
    public init?(_ description: String) {
        self.source = [0]
    }
    
    //MARK: - Words
    //FIXME
    
    //MARK: - Compare
    
    /// Returns a Boolean value indicating whether two values are equal
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`, `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    ///
    /// - Returns: `true` if `lhs` is equal to `rhs`
    public static func == (lhs: BigInt, rhs: BigInt) -> Bool {
        if(lhs.negative != rhs.negative) {
            return false
        }
        
        if(lhs.source.count != rhs.source.count) {
            return false
        }
        
        for i in 0..<lhs.source.count {
            if(lhs.source[i] != rhs.source[i]) {
                return false
            }
        }
        
        return true
    }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than or equal to that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    ///
    /// - Returns: `true` if `lhs` is greater than or equal to `rhs`
    public static func >= (lhs: BigInt, rhs: BigInt) -> Bool {
        if(lhs.negative && rhs.negative) { //Both Negative
            return -lhs <= -rhs
        } else if(lhs.negative) { //lhs is Negative, rhs is Positive
            return false
        } else if(rhs.negative) { //lhs is Positive, rhs is Negative
            return true
        }
        
        //Both are Positive
        if(lhs.source.count > rhs.source.count) { // [3, 4, 5, 3] > [2, 3, 4] -> 4 > 3 -> return true
            return true
        } else if(lhs.source.count == rhs.source.count) { // [3, 4, 5] > [2, 3, 4] -> 3 == 3 -> thus we have to look at the array's closer
            var index: Int = lhs.source.count - 1
            
            while(index >= 0) {
                if(lhs.source[index] > rhs.source[index]) {
                    return true
                } else if(lhs.source[index] < rhs.source[index]) {
                    return false
                }
                
                index -= 1
            }
            
            //If we made it here, the array must be the same, ie lhs == rhs
            return true
        }
        
        return false
    }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than or equal to that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    ///
    /// - Returns: `true` if `lhs` is lesser than or equal to `rhs`
    public static func <= (lhs: BigInt, rhs: BigInt) -> Bool {
        if(lhs.source.count < rhs.source.count) { // [3, 4, 5] < [2, 3, 4, 1] -> 3 < 4 -> return true
            return true
        } else if(lhs.source.count == rhs.source.count) { // [3, 4, 5] < [2, 3, 4] -> 3 == 3 -> thus we have to look at the array's closer
            var index: Int = lhs.source.count - 1
            
            while(index >= 0) {
                if(lhs.source[index] < rhs.source[index]) {
                    return true
                } else if(lhs.source[index] > rhs.source[index]) {
                    return false
                }
                
                index -= 1
            }
            
            //If we made it here, the array must be the same, ie lhs == rhs
            return true
        }
        
        return false
    }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    /// - Returns: `true` if `lhs` is greater than `rhs`
    public static func > (lhs: BigInt, rhs: BigInt) -> Bool {
        if(lhs.source.count > rhs.source.count) { // [3, 4, 5, 3] > [2, 3, 4] -> 4 > 3 -> return true
            return true
        } else if(lhs.source.count == rhs.source.count) { // [3, 4, 5] > [2, 3, 4] -> 3 == 3 -> thus we have to look at the array's closer
            var index: Int = lhs.source.count - 1
            
            while(index >= 0) {
                if(lhs.source[index] > rhs.source[index]) {
                    return true
                } else if(lhs.source[index] < rhs.source[index]) {
                    return false
                }
                
                index -= 1
            }
        }
        
        return false
    }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    ///
    /// - Returns: `true` if `lhs` is lesser than `rhs`
    public static func < (lhs: BigInt, rhs: BigInt) -> Bool {
        if(lhs.source.count < rhs.source.count) { // [3, 4, 5] < [2, 3, 4, 1] -> 3 < 4 -> return true
            return true
        } else if(lhs.source.count == rhs.source.count) { // [3, 4, 5] < [2, 3, 4] -> 3 == 3 -> thus we have to look at the array's closer
            var index: Int = lhs.source.count - 1
            
            while(index >= 0) {
                if(lhs.source[index] < rhs.source[index]) {
                    return true
                } else if(lhs.source[index] > rhs.source[index]) {
                    return false
                }
                
                index -= 1
            }
        }
        
        return false
    }
    
    //MARK: - Arithmetic
    //MARK: Sum
    /// Adds two values and produces their sum.
    ///
    /// The addition operator (`+`) calculates the sum of its two arguments. For
    /// example:
    ///
    ///     1 + 2                   // 3
    ///     -10 + 15                // 5
    ///     -15 + -5                // -20
    ///     21.5 + 3.25             // 24.75
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    /// - Returns: The sum of two values, `lhs` and `rhs`
    public static func + (lhs: BigInt, rhs: BigInt) -> BigInt {
        var result: [Int] = [Int]()
        
        for i in 0..<max(lhs.source.count, rhs.source.count) {
            let left: Int = (lhs.negative ? -1 : 1)*(i < lhs.source.count ? lhs.source[i] : 0)
            let right: Int = (rhs.negative ? -1 : 1)*(i < rhs.source.count ? rhs.source[i] : 0)
            let value: Int = left + right
            result.append(value)
        }
        
        return BigInt(result)
    }
    
    public static func + (lhs: BigInt, rhs: Int) -> BigInt {
        return lhs + BigInt(rhs)
    }
    
    public static func + (lhs: Int, rhs: BigInt) -> BigInt {
        return BigInt(lhs) + rhs
    }
    
    /// Adds two values and stores the result in the left-hand-side variable.
    ///
    /// The sum of the two arguments must be representable in the arguments'
    /// type.
    ///
    /// - Parameters:
    ///   - lhs: The first value to add.
    ///   - rhs: The second value to add.
    public static func += (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs + rhs
    }
    
    public static func += (lhs: inout BigInt, rhs: Int) {
        lhs = lhs + rhs
    }
    
    //MARK: Subtract
    /// Subtracts one value from another and produces their difference.
    ///
    /// The subtraction operator (`-`) calculates the difference of its two
    /// arguments. For example:
    ///
    ///     8 - 3                   // 5
    ///     -10 - 5                 // -15
    ///     100 - -5                // 105
    ///     10.5 - 100.0            // -89.5
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    public static func - (lhs: BigInt, rhs: BigInt) -> BigInt {
        var result = [Int]()
        
        for i in 0..<max(lhs.source.count, rhs.source.count) {
            let left: Int = (lhs.negative ? -1 : 1)*(i < lhs.source.count ? lhs.source[i] : 0)
            let right: Int = (rhs.negative ? -1 : 1)*(i < rhs.source.count ? rhs.source[i] : 0)
            let value: Int = left - right
            
            result.append(value)
        }
        
        return BigInt(result)
    }
    
    public static func - (lhs: BigInt, rhs: Int) -> BigInt {
        return lhs - BigInt(rhs)
    }
    
    public static func - (lhs: Int, rhs: BigInt) -> BigInt {
        return BigInt(lhs) - rhs
    }
    
    /// Subtracts the second value from the first and stores the difference in the
    /// left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: A numeric value.
    ///   - rhs: The value to subtract from `lhs`.
    public static func -= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs - rhs
    }
    
    public static func -= (lhs: inout BigInt, rhs: Int) {
        lhs = lhs - rhs
    }
    
    //MARK: Product
    /// Multiplies two values and produces their product.
    ///
    /// The multiplication operator (`*`) calculates the product of its two
    /// arguments. For example:
    ///
    ///     2 * 3                   // 6
    ///     100 * 21                // 2100
    ///     -10 * 15                // -150
    ///     3.5 * 2.25              // 7.875
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    public static func * (lhs: BigInt, rhs: BigInt) -> BigInt {
        var result = BigInt()

        for i in 0..<rhs.source.count {
            var smallResult = lhs.source
            smallResult *= rhs.source[i]
            smallResult *= 10^^i
            
            result += BigInt(smallResult)
        }
        
        result.negative = lhs.negative != rhs.negative
    
        return result
    }
    
    public static func * (lhs: BigInt, rhs: Int) -> BigInt {
        return lhs * BigInt(rhs)
    }
    
    public static func * (lhs: Int, rhs: BigInt) -> BigInt {
        return BigInt(lhs) * rhs
    }
    
    /// Multiplies two values and stores the result in the left-hand-side
    /// variable.
    ///
    /// - Parameters:
    ///   - lhs: The first value to multiply.
    ///   - rhs: The second value to multiply.
    public static func *= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs * rhs
    }
    
    public static func *= (lhs: inout BigInt, rhs: Int) {
        lhs = lhs * rhs
    }
    
    //MARK: Divison
    /// Returns the quotient of dividing the first value by the second.
    ///
    /// For integer types, any remainder of the division is discarded.
    ///
    ///     let x = 21 / 5
    ///     // x == 4
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
    public static func / (lhs: BigInt, rhs: BigInt) -> BigInt {
        if(rhs == BigInt()) {
            //FIXME: Should be an overflow error
            return BigInt()
        }
        
        var result = BigInt()
        
        let dividend: BigInt = lhs.abs()
        let divisor: BigInt = rhs.abs()
        
        var partialDividend: BigInt = BigInt(dividend.source.last ?? 0)
        var pdIndex: Int = dividend.source.count - 2
        
        while(pdIndex >= 0) {
            while(partialDividend < divisor) {
                partialDividend.source.insert(0, at: 0)
                partialDividend += dividend.source[pdIndex]
                pdIndex -= 1
            }
        
            while(partialDividend >= divisor) {
                partialDividend -= divisor
                result += dividend.sourcePower(pdIndex + 1)
            }
        }
        
        //Negative
        result.negative = lhs.negative != rhs.negative
            
        return result
    }
    
    public static func / (lhs: BigInt, rhs: Int) -> BigInt {
        return lhs / BigInt(rhs)
    }
    
    public static func / (lhs: Int, rhs: BigInt) -> BigInt {
        return BigInt(lhs) / rhs
    }
    
    /// Divides the first value by the second and stores the quotient in the
    /// left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
    public static func /= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs / rhs
    }
    
    //MARK: Modulus
    /// Returns the remainder of dividing the first value by the second.
    ///
    /// The result of the remainder operator (`%`) has the same sign as `lhs` and
    /// has a magnitude less than `rhs.magnitude`.
    ///
    ///     let x = 22 % 5
    ///     // x == 2
    ///     let y = 22 % -5
    ///     // y == 2
    ///     let z = -22 % -5
    ///     // z == -2
    ///
    /// For any two integers `a` and `b`, their quotient `q`, and their remainder
    /// `r`, `a == b * q + r`.
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
    public static func % (lhs: BigInt, rhs: BigInt) -> BigInt {
        let dividend: BigInt = lhs.abs()
        let divisor: BigInt = rhs.abs()
        
        var partialDividend: BigInt = BigInt(dividend.source.last ?? 0)
        var pdIndex: Int = dividend.source.count - 2
        
        while(pdIndex >= 0) {
            while(partialDividend < divisor) {
                partialDividend.source.insert(0, at: 0)
                partialDividend += dividend.source[pdIndex]
                pdIndex -= 1
            }
        
            while(partialDividend >= divisor) {
                partialDividend -= divisor
            }
        }
        
        //Negative
        partialDividend.negative = lhs.negative != rhs.negative
        
        return partialDividend
    }
    
    /// Divides the first value by the second and stores the remainder in the
    /// left-hand-side variable.
    ///
    /// The result has the same sign as `lhs` and has a magnitude less than
    /// `rhs.magnitude`.
    ///
    ///     var x = 22
    ///     x %= 5
    ///     // x == 2
    ///
    ///     var y = 22
    ///     y %= -5
    ///     // y == 2
    ///
    ///     var z = -22
    ///     z %= -5
    ///     // z == -2
    ///
    /// - Parameters:
    ///   - lhs: The value to divide.
    ///   - rhs: The value to divide `lhs` by. `rhs` must not be zero.
    public static func %= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs % rhs
    }
    
    //MARK: Prefixs
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
    prefix public static func - (operand: BigInt) -> BigInt {
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
        negative.toggle()
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
    prefix public static func + (x: BigInt) -> BigInt {
        return x
    }
    
    
    //MARK: - Bitwise
    //MARK: AND
    /// Returns the result of performing a bitwise AND operation on the two given
    /// values.
    ///
    /// A bitwise AND operation results in a value that has each bit set to `1`
    /// where *both* of its arguments have that bit set to `1`. For example:
    ///
    ///     let x: UInt8 = 5          // 0b00000101
    ///     let y: UInt8 = 14         // 0b00001110
    ///     let z = x & y             // 0b00000100
    ///     // z == 4
    ///
    /// - Parameters:
    ///   - lhs: An integer value.
    ///   - rhs: Another integer value.
    public static func & (lhs: BigInt, rhs: BigInt) -> BigInt {
        return BigInt()
    }
    
    /// Stores the result of performing a bitwise AND operation on the two given
    /// values in the left-hand-side variable.
    ///
    /// A bitwise AND operation results in a value that has each bit set to `1`
    /// where *both* of its arguments have that bit set to `1`. For example:
    ///
    ///     var x: UInt8 = 5          // 0b00000101
    ///     let y: UInt8 = 14         // 0b00001110
    ///     x &= y                    // 0b00000100
    ///
    /// - Parameters:
    ///   - lhs: An integer value.
    ///   - rhs: Another integer value.
    public static func &= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs & rhs
    }
    
    //MARK: OR
    /// Returns the result of performing a bitwise OR operation on the two given
    /// values.
    ///
    /// A bitwise OR operation results in a value that has each bit set to `1`
    /// where *one or both* of its arguments have that bit set to `1`. For
    /// example:
    ///
    ///     let x: UInt8 = 5          // 0b00000101
    ///     let y: UInt8 = 14         // 0b00001110
    ///     let z = x | y             // 0b00001111
    ///     // z == 15
    ///
    /// - Parameters:
    ///   - lhs: An integer value.
    ///   - rhs: Another integer value.
    public static func | (lhs: BigInt, rhs: BigInt) -> BigInt {
        return BigInt()
    }
    
    /// Stores the result of performing a bitwise OR operation on the two given
    /// values in the left-hand-side variable.
    ///
    /// A bitwise OR operation results in a value that has each bit set to `1`
    /// where *one or both* of its arguments have that bit set to `1`. For
    /// example:
    ///
    ///     var x: UInt8 = 5          // 0b00000101
    ///     let y: UInt8 = 14         // 0b00001110
    ///     x |= y                    // 0b00001111
    ///
    /// - Parameters:
    ///   - lhs: An integer value.
    ///   - rhs: Another integer value.
    public static func |= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs | rhs
    }
    
    //MARK: XOR
    /// Returns the result of performing a bitwise XOR operation on the two given
    /// values.
    ///
    /// A bitwise XOR operation, also known as an exclusive OR operation, results
    /// in a value that has each bit set to `1` where *one or the other but not
    /// both* of its arguments had that bit set to `1`. For example:
    ///
    ///     let x: UInt8 = 5          // 0b00000101
    ///     let y: UInt8 = 14         // 0b00001110
    ///     let z = x ^ y             // 0b00001011
    ///     // z == 11
    ///
    /// - Parameters:
    ///   - lhs: An integer value.
    ///   - rhs: Another integer value.
    public static func ^ (lhs: BigInt, rhs: BigInt) -> BigInt {
        return BigInt()
    }
    
    /// Stores the result of performing a bitwise XOR operation on the two given
    /// values in the left-hand-side variable.
    ///
    /// A bitwise XOR operation, also known as an exclusive OR operation, results
    /// in a value that has each bit set to `1` where *one or the other but not
    /// both* of its arguments had that bit set to `1`. For example:
    ///
    ///     var x: UInt8 = 5          // 0b00000101
    ///     let y: UInt8 = 14         // 0b00001110
    ///     x ^= y                    // 0b00001011
    ///
    /// - Parameters:
    ///   - lhs: An integer value.
    ///   - rhs: Another integer value.
    public static func ^= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs ^ rhs
    }
    
    //MARK: &>>
    /// Returns the result of shifting a value's binary representation the
    /// specified number of digits to the right, masking the shift amount to the
    /// type's bit width.
    ///
    /// Use the masking right shift operator (`&>>`) when you need to perform a
    /// shift and are sure that the shift amount is in the range
    /// `0..<lhs.bitWidth`. Before shifting, the masking right shift operator
    /// masks the shift to this range. The shift is performed using this masked
    /// value.
    ///
    /// The following example defines `x` as an instance of `UInt8`, an 8-bit,
    /// unsigned integer type. If you use `2` as the right-hand-side value in an
    /// operation on `x`, the shift amount requires no masking.
    ///
    ///     let x: UInt8 = 30                 // 0b00011110
    ///     let y = x &>> 2
    ///     // y == 7                         // 0b00000111
    ///
    /// However, if you use `8` as the shift amount, the method first masks the
    /// shift amount to zero, and then performs the shift, resulting in no change
    /// to the original value.
    ///
    ///     let z = x &>> 8
    ///     // z == 30                        // 0b00011110
    ///
    /// If the bit width of the shifted integer type is a power of two, masking
    /// is performed using a bitmask; otherwise, masking is performed using a
    /// modulo operation.
    ///
    /// - Parameters:
    ///   - lhs: The value to shift.
    ///   - rhs: The number of bits to shift `lhs` to the right. If `rhs` is
    ///     outside the range `0..<lhs.bitWidth`, it is masked to produce a
    ///     value within that range.
    public static func &>> (lhs: BigInt, rhs: BigInt) -> BigInt {
        return BigInt()
    }
    
    /// Calculates the result of shifting a value's binary representation the
    /// specified number of digits to the right, masking the shift amount to the
    /// type's bit width, and stores the result in the left-hand-side variable.
    ///
    /// The `&>>=` operator performs a *masking shift*, where the value passed as
    /// `rhs` is masked to produce a value in the range `0..<lhs.bitWidth`. The
    /// shift is performed using this masked value.
    ///
    /// The following example defines `x` as an instance of `UInt8`, an 8-bit,
    /// unsigned integer type. If you use `2` as the right-hand-side value in an
    /// operation on `x`, the shift amount requires no masking.
    ///
    ///     var x: UInt8 = 30                 // 0b00011110
    ///     x &>>= 2
    ///     // x == 7                         // 0b00000111
    ///
    /// However, if you use `19` as `rhs`, the operation first bitmasks `rhs` to
    /// `3`, and then uses that masked value as the number of bits to shift `lhs`.
    ///
    ///     var y: UInt8 = 30                 // 0b00011110
    ///     y &>>= 19
    ///     // y == 3                         // 0b00000011
    ///
    /// - Parameters:
    ///   - lhs: The value to shift.
    ///   - rhs: The number of bits to shift `lhs` to the right. If `rhs` is
    ///     outside the range `0..<lhs.bitWidth`, it is masked to produce a
    ///     value within that range.
    public static func &>>= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs &>> rhs
    }
    
    //MARK: &<<
    /// Returns the result of shifting a value's binary representation the
    /// specified number of digits to the left, masking the shift amount to the
    /// type's bit width.
    ///
    /// Use the masking left shift operator (`&<<`) when you need to perform a
    /// shift and are sure that the shift amount is in the range
    /// `0..<lhs.bitWidth`. Before shifting, the masking left shift operator
    /// masks the shift to this range. The shift is performed using this masked
    /// value.
    ///
    /// The following example defines `x` as an instance of `UInt8`, an 8-bit,
    /// unsigned integer type. If you use `2` as the right-hand-side value in an
    /// operation on `x`, the shift amount requires no masking.
    ///
    ///     let x: UInt8 = 30                 // 0b00011110
    ///     let y = x &<< 2
    ///     // y == 120                       // 0b01111000
    ///
    /// However, if you use `8` as the shift amount, the method first masks the
    /// shift amount to zero, and then performs the shift, resulting in no change
    /// to the original value.
    ///
    ///     let z = x &<< 8
    ///     // z == 30                        // 0b00011110
    ///
    /// If the bit width of the shifted integer type is a power of two, masking
    /// is performed using a bitmask; otherwise, masking is performed using a
    /// modulo operation.
    ///
    /// - Parameters:
    ///   - lhs: The value to shift.
    ///   - rhs: The number of bits to shift `lhs` to the left. If `rhs` is
    ///     outside the range `0..<lhs.bitWidth`, it is masked to produce a
    ///     value within that range.
    public static func &<< (lhs: BigInt, rhs: BigInt) -> BigInt {
        return BigInt()
    }
    
    /// Returns the result of shifting a value's binary representation the
    /// specified number of digits to the left, masking the shift amount to the
    /// type's bit width, and stores the result in the left-hand-side variable.
    ///
    /// The `&<<=` operator performs a *masking shift*, where the value used as
    /// `rhs` is masked to produce a value in the range `0..<lhs.bitWidth`. The
    /// shift is performed using this masked value.
    ///
    /// The following example defines `x` as an instance of `UInt8`, an 8-bit,
    /// unsigned integer type. If you use `2` as the right-hand-side value in an
    /// operation on `x`, the shift amount requires no masking.
    ///
    ///     var x: UInt8 = 30                 // 0b00011110
    ///     x &<<= 2
    ///     // x == 120                       // 0b01111000
    ///
    /// However, if you pass `19` as `rhs`, the method first bitmasks `rhs` to
    /// `3`, and then uses that masked value as the number of bits to shift `lhs`.
    ///
    ///     var y: UInt8 = 30                 // 0b00011110
    ///     y &<<= 19
    ///     // y == 240                       // 0b11110000
    ///
    /// - Parameters:
    ///   - lhs: The value to shift.
    ///   - rhs: The number of bits to shift `lhs` to the left. If `rhs` is
    ///     outside the range `0..<lhs.bitWidth`, it is masked to produce a
    ///     value within that range.
    public static func &<<= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs &<< rhs
    }
    
    //MARK: Prefixs
    /// Returns the inverse of the bits set in the argument.
    ///
    /// The bitwise NOT operator (`~`) is a prefix operator that returns a value
    /// in which all the bits of its argument are flipped: Bits that are `1` in
    /// the argument are `0` in the result, and bits that are `0` in the argument
    /// are `1` in the result. This is equivalent to the inverse of a set. For
    /// example:
    ///
    ///     let x: UInt8 = 5        // 0b00000101
    ///     let notX = ~x           // 0b11111010
    ///
    /// Performing a bitwise NOT operation on 0 returns a value with every bit
    /// set to `1`.
    ///
    ///     let allOnes = ~UInt8.min   // 0b11111111
    ///
    /// - Complexity: O(1).
    prefix public static func ~ (x: BigInt) -> BigInt {
        return BigInt()
    }
    
    //MARK: - Strideable
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
    public func distance(to other: BigInt) -> Int {
        var distance = self - other
        distance.negative = false

        //FIXME: Change to BigInt
        return 3//distance
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
    public func advanced(by n: Int) -> BigInt {
        return self + n
    }
    
    //MARK: - Range
    
    /// Returns a closed range that contains both of its bounds.
    ///
    /// Use the closed range operator (`...`) to create a closed range of any type
    /// that conforms to the `Comparable` protocol. This example creates a
    /// `ClosedRange<Character>` from "a" up to, and including, "z".
    ///
    ///     let lowercase = "a"..."z"
    ///     print(lowercase.contains("z"))
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - minimum: The lower bound for the range.
    ///   - maximum: The upper bound for the range.
    ///
    /// - Precondition: `minimum <= maximum`.
    public static func ... (minimum: BigInt, maximum: BigInt) -> ClosedRange<BigInt> {
        if(minimum <= maximum) {
            return ClosedRange<BigInt>(uncheckedBounds: (lower: minimum, upper: maximum))
        }
        
        //FIXME: Might Want to throw an error??
        return ClosedRange<BigInt>(uncheckedBounds: (lower: BigInt(), upper: BigInt()))
    }
    
    public static func ... (minimum: BigInt, maximum: Int) -> ClosedRange<BigInt> {
        return minimum...BigInt(maximum)
    }
    
    public static func ... (minimum: Int, maximum: BigInt) -> ClosedRange<BigInt> {
        return BigInt(minimum)...maximum
    }
    
    /// Returns a partial range up to, and including, its upper bound.
    ///
    /// Use the prefix closed range operator (prefix `...`) to create a partial
    /// range of any type that conforms to the `Comparable` protocol. This
    /// example creates a `PartialRangeThrough<Double>` instance that includes
    /// any value less than or equal to `5.0`.
    ///
    ///     let throughFive = ...5.0
    ///
    ///     throughFive.contains(4.0)     // true
    ///     throughFive.contains(5.0)     // true
    ///     throughFive.contains(6.0)     // false
    ///
    /// You can use this type of partial range of a collection's indices to
    /// represent the range from the start of the collection up to, and
    /// including, the partial range's upper bound.
    ///
    ///     let numbers = [10, 20, 30, 40, 50, 60, 70]
    ///     print(numbers[...3])
    ///     // Prints "[10, 20, 30, 40]"
    ///
    /// - Parameter maximum: The upper bound for the range.
    ///
    /// - Precondition: `maximum` must compare equal to itself (i.e. cannot be NaN).
    prefix public static func ... (maximum: BigInt) -> PartialRangeThrough<Int> {
        //FIXME: I don't know
        return ...4
    }
    
    /// Returns a partial range extending upward from a lower bound.
    ///
    /// Use the postfix range operator (postfix `...`) to create a partial range
    /// of any type that conforms to the `Comparable` protocol. This example
    /// creates a `PartialRangeFrom<Double>` instance that includes any value
    /// greater than or equal to `5.0`.
    ///
    ///     let atLeastFive = 5.0...
    ///
    ///     atLeastFive.contains(4.0)     // false
    ///     atLeastFive.contains(5.0)     // true
    ///     atLeastFive.contains(6.0)     // true
    ///
    /// You can use this type of partial range of a collection's indices to
    /// represent the range from the partial range's lower bound up to the end
    /// of the collection.
    ///
    ///     let numbers = [10, 20, 30, 40, 50, 60, 70]
    ///     print(numbers[3...])
    ///     // Prints "[40, 50, 60, 70]"
    ///
    /// - Parameter minimum: The lower bound for the range.
    ///
    /// - Precondition: `minimum` must compare equal to itself (i.e. cannot be NaN).
    postfix public static func ... (minimum: BigInt) -> PartialRangeFrom<Int> {
        //FIXME: I don't Know
        return 3...
    }
    
    /// Returns a half-open range that contains its lower bound but not its upper
    /// bound.
    ///
    /// Use the half-open range operator (`..<`) to create a range of any type
    /// that conforms to the `Comparable` protocol. This example creates a
    /// `Range<Double>` from zero up to, but not including, 5.0.
    ///
    ///     let lessThanFive = 0.0..<5.0
    ///     print(lessThanFive.contains(3.14))  // Prints "true"
    ///     print(lessThanFive.contains(5.0))   // Prints "false"
    ///
    /// - Parameters:
    ///   - minimum: The lower bound for the range.
    ///   - maximum: The upper bound for the range.
    ///
    /// - Precondition: `minimum <= maximum`.
    public static func ..< (minimum: BigInt, maximum: BigInt) -> Range<BigInt> {
        if(minimum <= maximum) {
            return Range<BigInt>(uncheckedBounds: (lower: minimum, upper: maximum))
        }
        
        //FIXME: ???? Should I throw an error here ?????
        return Range<BigInt>(uncheckedBounds: (lower: BigInt(), upper: BigInt()))
    }
    
    /// Returns a partial range up to, but not including, its upper bound.
    ///
    /// Use the prefix half-open range operator (prefix `..<`) to create a
    /// partial range of any type that conforms to the `Comparable` protocol.
    /// This example creates a `PartialRangeUpTo<Double>` instance that includes
    /// any value less than `5.0`.
    ///
    ///     let upToFive = ..<5.0
    ///
    ///     upToFive.contains(3.14)       // true
    ///     upToFive.contains(6.28)       // false
    ///     upToFive.contains(5.0)        // false
    ///
    /// You can use this type of partial range of a collection's indices to
    /// represent the range from the start of the collection up to, but not
    /// including, the partial range's upper bound.
    ///
    ///     let numbers = [10, 20, 30, 40, 50, 60, 70]
    ///     print(numbers[..<3])
    ///     // Prints "[10, 20, 30]"
    ///
    /// - Parameter maximum: The upper bound for the range.
    ///
    /// - Precondition: `maximum` must compare equal to itself (i.e. cannot be NaN).
    prefix public static func ..< (maximum: BigInt) -> PartialRangeUpTo<Int> {
        //FIXME: I don't Know
        return ..<3
    }
    
    //MARK: - Random
    
    
    //MARK: - Other
    public func abs() -> BigInt {
        if(negative) {
            return -self
        }
        return self
    }
    
    func factorial() -> BigInt {
        var factorial = BigInt(1)
        
        for i in 2...self {
            factorial *= i
        }
        
        return factorial
    }
    
    mutating func reArangeArray() {
        let reArr = reArange(array: source)
        negative = reArr.0
        source = reArr.1
    }
    
    /// [1, 23, 4] -> [1, 3, 6]
    /// [1, 2, 3, 0, 0] -> [1, 2, 3]
    /// [-1, 2, 3] -> [9, 1, 3]
    /// [1, 2, -3, 4] -> [1, 2, 7, 3]
    /// [1, 2, -3] -> -[9, 8, 2]
    /// [-1, -2, -3] -> -[1, 2, 3]
    func reArange(array: [Int]) -> (Bool, [Int]) {
        //Make soure every element in source only has one digit
        var i = 0
        var source = array
        var negative = false
        
        while(i < source.count) {
            if(source[i] > 9 || source[i] < -9) { // 10 and up
                if(i + 1 >= source.count) {
                    source.append(0)
                }
                
                source[i + 1] += source[i]/10
                source[i] %= 10
            }
            
            if(source[i] < 0) { //Negativs
                if(i + 1 >= source.count) {
                    negative = true
                    for j in 0..<source.count {
                        source[j] *= -1
                    }
                    i = -1
                } else {
                    source[i + 1] -= 1
                    source[i] += 10
                }
            }
            
            i += 1
        }
        
        //Make soure there are no leading 0's
        while(source.last == 0) {
            source.removeLast()
        }
        
        if(source.count == 0) {
            source = [0]
        }
        
        return (negative, source)
    }
    
    func toString() -> String {
        var str: String = ""
        
        if(negative) {
            str += "-"
        }
        
        let reSource: [Int] = source.reversed()
        
        for i in 0..<reSource.count {
            let offset = reSource.count % 3
            
            if(i != 0 && i != reSource.count - 1 && (i - offset) % 3 == 0) {
                str += ","
            }
            str += String(reSource[i])
        }
        
        return str
    }
    
    func sourcePower(_ index: Int) -> BigInt {
        var result = BigInt(1)
        
        for _ in 0..<index {
            result *= 10
        }
        
        return result
    }
    
}
