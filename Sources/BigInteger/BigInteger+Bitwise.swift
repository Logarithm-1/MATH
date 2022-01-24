// BigInteger+Bitwise.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

extension BigInteger {
    //MARK: - And
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
    public static func &(lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        var result: BigInteger = 0
        
        //Min since what ever whould go over whould be false, thus the and would also return false.
        for i in 0..<min(lhs.bitWidth, rhs.bitWidth) {
            result[i] = lhs[i] && rhs[i]
        }
        
        return result
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
    public static func &= (lhs: inout BigInteger, rhs: BigInteger) {
        lhs = lhs & rhs
    }
    
    //MARK: - OR
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
    public static func |(lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        var result: BigInteger = 0
        
        for i in 0..<max(lhs.bitWidth, rhs.bitWidth) {
            result[i] = lhs[i] || rhs[i]
        }
        
        return result
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
    public static func |=(lhs: inout BigInteger, rhs: BigInteger) {
        lhs = lhs | rhs
    }
    
    //MARK: - XOR
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
    public static func ^(lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        var result: BigInteger = 0
        
        for i in 0..<max(lhs.bitWidth, rhs.bitWidth) {
            //If left is the same as right (wether true of false) return false
            //If left is different then right (one of them is true, the other is false) return ture
            result[i] = lhs[i] != rhs[i]
        }
        
        return result
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
    public static func ^=(lhs: inout BigInteger, rhs: BigInteger) {
        lhs = lhs ^ rhs
    }
    
    //MARK: - Move to the Right
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
    public static func &>> (lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        var result: BigInteger = lhs
        
        //FIXME: Remove toInt (ie when Range is complete)
        for _ in 0..<rhs.toInt() {
            if(result.bitWidth >= 1) {
                result.source.removeFirst()
            }
        }
        
        if(result.bitWidth == 0) {
            result[0] = false
        }
        
        return result
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
    public static func &>>=(lhs: inout BigInteger, rhs: BigInteger) {
        lhs = lhs &>> rhs
    }
    
    //MARK: - Move to the Left
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
    public static func &<< (lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        var result: BigInteger = lhs
        
        if(rhs.toInt() == 0) {
            return lhs
        }
        
        //FIXME: Remove toInt() when Range is complete
        for _ in 0..<rhs.toInt() {
            result.source.insert(false, at: 0)
        }
        
        return result
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
    public static func &<<= (lhs: inout BigInteger, rhs: BigInteger) {
        lhs = lhs &<< rhs
    }
    
    //MARK: - NOT
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
    prefix public static func ~(x: BigInteger) -> BigInteger {
        var result: BigInteger = BigInteger()

        for i in 0..<x.bitWidth {
            result[i] = !x[i]
        }
        
        return result
    }
}
