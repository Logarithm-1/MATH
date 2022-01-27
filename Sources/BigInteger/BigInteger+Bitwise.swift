// BigInteger+Bitwise.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/NumberTheory/blob/main/LICENSE for license information

extension BigInteger {
    public func twosComplement() -> BigUInteger {
        switch sign {
        case.plus:
            return magnitude
        case.minus:
            return (~magnitude) + 1
        }
    }
    
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
        return BigInteger(sign: (lhs.sign == .minus || rhs.sign == .minus) ? .minus : .plus,
                          magnitude: lhs.twosComplement() & rhs.twosComplement())
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
    
    //MARK: - Or
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
        return BigInteger(sign: (lhs.sign == .minus || rhs.sign == .minus) ? .minus : .plus,
                          magnitude: lhs.twosComplement() | rhs.twosComplement())
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
        return BigInteger(sign: (lhs.sign == .minus || rhs.sign == .minus) ? .minus : .plus,
                          magnitude: lhs.twosComplement() ^ rhs.twosComplement())
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
    public static func &>>(lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        guard rhs >= 0 else {
            return lhs
        }
        
        let m = lhs.magnitude &>> rhs.magnitude
        return BigInteger(sign: lhs.sign, magnitude: lhs.sign == .minus && m.isZero ? 1 : m)
    }
    
    /// Returns the result of shifting a value's binary representation the
    /// specified number of digits to the right.
    ///
    /// The `>>` operator performs a *smart shift*, which defines a result for a
    /// shift of any value.
    ///
    /// - Using a negative value for `rhs` performs a left shift using
    ///   `abs(rhs)`.
    /// - Using a value for `rhs` that is greater than or equal to the bit width
    ///   of `lhs` is an *overshift*. An overshift results in `-1` for a
    ///   negative value of `lhs` or `0` for a nonnegative value.
    /// - Using any other value for `rhs` performs a right shift on `lhs` by that
    ///   amount.
    ///
    /// The following example defines `x` as an instance of `UInt8`, an 8-bit,
    /// unsigned integer type. If you use `2` as the right-hand-side value in an
    /// operation on `x`, the value is shifted right by two bits.
    ///
    ///     let x: UInt8 = 30                 // 0b00011110
    ///     let y = x >> 2
    ///     // y == 7                         // 0b00000111
    ///
    /// If you use `11` as `rhs`, `x` is overshifted such that all of its bits
    /// are set to zero.
    ///
    ///     let z = x >> 11
    ///     // z == 0                         // 0b00000000
    ///
    /// Using a negative value as `rhs` is the same as performing a left shift
    /// using `abs(rhs)`.
    ///
    ///     let a = x >> -3
    ///     // a == 240                       // 0b11110000
    ///     let b = x << 3
    ///     // b == 240                       // 0b11110000
    ///
    /// Right shift operations on negative values "fill in" the high bits with
    /// ones instead of zeros.
    ///
    ///     let q: Int8 = -30                 // 0b11100010
    ///     let r = q >> 2
    ///     // r == -8                        // 0b11111000
    ///
    ///     let s = q >> 11
    ///     // s == -1                        // 0b11111111
    ///
    /// - Parameters:
    ///   - lhs: The value to shift.
    ///   - rhs: The number of bits to shift `lhs` to the right.
    public static func >><Other: BinaryInteger>(lhs: BigInteger, rhs: Other) -> BigInteger {
        guard rhs >= 0 else {
            return lhs
        }
        
        return lhs &>> BigInteger(rhs)
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
    
    /// Stores the result of shifting a value's binary representation the
    /// specified number of digits to the right in the left-hand-side variable.
    ///
    /// The `>>=` operator performs a *smart shift*, which defines a result for a
    /// shift of any value.
    ///
    /// - Using a negative value for `rhs` performs a left shift using
    ///   `abs(rhs)`.
    /// - Using a value for `rhs` that is greater than or equal to the bit width
    ///   of `lhs` is an *overshift*. An overshift results in `-1` for a
    ///   negative value of `lhs` or `0` for a nonnegative value.
    /// - Using any other value for `rhs` performs a right shift on `lhs` by that
    ///   amount.
    ///
    /// The following example defines `x` as an instance of `UInt8`, an 8-bit,
    /// unsigned integer type. If you use `2` as the right-hand-side value in an
    /// operation on `x`, the value is shifted right by two bits.
    ///
    ///     var x: UInt8 = 30                 // 0b00011110
    ///     x >>= 2
    ///     // x == 7                         // 0b00000111
    ///
    /// If you use `11` as `rhs`, `x` is overshifted such that all of its bits
    /// are set to zero.
    ///
    ///     var y: UInt8 = 30                 // 0b00011110
    ///     y >>= 11
    ///     // y == 0                         // 0b00000000
    ///
    /// Using a negative value as `rhs` is the same as performing a left shift
    /// using `abs(rhs)`.
    ///
    ///     var a: UInt8 = 30                 // 0b00011110
    ///     a >>= -3
    ///     // a == 240                       // 0b11110000
    ///
    ///     var b: UInt8 = 30                 // 0b00011110
    ///     b <<= 3
    ///     // b == 240                       // 0b11110000
    ///
    /// Right shift operations on negative values "fill in" the high bits with
    /// ones instead of zeros.
    ///
    ///     var q: Int8 = -30                 // 0b11100010
    ///     q >>= 2
    ///     // q == -8                        // 0b11111000
    ///
    ///     var r: Int8 = -30                 // 0b11100010
    ///     r >>= 11
    ///     // r == -1                        // 0b11111111
    ///
    /// - Parameters:
    ///   - lhs: The value to shift.
    ///   - rhs: The number of bits to shift `lhs` to the right.
    public static func >>=<Other: BinaryInteger>(lhs: inout BigInteger, rhs: Other) {
        lhs = lhs >> rhs
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
        guard rhs > 0 else {
            return lhs
        }
        
        return BigInteger(sign: lhs.sign, magnitude: lhs.magnitude &<< rhs.magnitude)
    }
    
    /// Returns the result of shifting a value's binary representation the
    /// specified number of digits to the left.
    ///
    /// The `<<` operator performs a *smart shift*, which defines a result for a
    /// shift of any value.
    ///
    /// - Using a negative value for `rhs` performs a right shift using
    ///   `abs(rhs)`.
    /// - Using a value for `rhs` that is greater than or equal to the bit width
    ///   of `lhs` is an *overshift*, resulting in zero.
    /// - Using any other value for `rhs` performs a left shift on `lhs` by that
    ///   amount.
    ///
    /// The following example defines `x` as an instance of `UInt8`, an 8-bit,
    /// unsigned integer type. If you use `2` as the right-hand-side value in an
    /// operation on `x`, the value is shifted left by two bits.
    ///
    ///     let x: UInt8 = 30                 // 0b00011110
    ///     let y = x << 2
    ///     // y == 120                       // 0b01111000
    ///
    /// If you use `11` as `rhs`, `x` is overshifted such that all of its bits
    /// are set to zero.
    ///
    ///     let z = x << 11
    ///     // z == 0                         // 0b00000000
    ///
    /// Using a negative value as `rhs` is the same as performing a right shift
    /// with `abs(rhs)`.
    ///
    ///     let a = x << -3
    ///     // a == 3                         // 0b00000011
    ///     let b = x >> 3
    ///     // b == 3                         // 0b00000011
    ///
    /// - Parameters:
    ///   - lhs: The value to shift.
    ///   - rhs: The number of bits to shift `lhs` to the left.
    public static func <<<Other: BinaryInteger>(lhs: BigInteger, rhs: Other) -> BigInteger {
        guard rhs > 0 else {
            return lhs
        }
        
        return lhs &<< BigInteger(rhs)
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
    
    /// Stores the result of shifting a value's binary representation the
    /// specified number of digits to the left in the left-hand-side variable.
    ///
    /// The `<<` operator performs a *smart shift*, which defines a result for a
    /// shift of any value.
    ///
    /// - Using a negative value for `rhs` performs a right shift using
    ///   `abs(rhs)`.
    /// - Using a value for `rhs` that is greater than or equal to the bit width
    ///   of `lhs` is an *overshift*, resulting in zero.
    /// - Using any other value for `rhs` performs a left shift on `lhs` by that
    ///   amount.
    ///
    /// The following example defines `x` as an instance of `UInt8`, an 8-bit,
    /// unsigned integer type. If you use `2` as the right-hand-side value in an
    /// operation on `x`, the value is shifted left by two bits.
    ///
    ///     var x: UInt8 = 30                 // 0b00011110
    ///     x <<= 2
    ///     // x == 120                       // 0b01111000
    ///
    /// If you use `11` as `rhs`, `x` is overshifted such that all of its bits
    /// are set to zero.
    ///
    ///     var y: UInt8 = 30                 // 0b00011110
    ///     y <<= 11
    ///     // y == 0                         // 0b00000000
    ///
    /// Using a negative value as `rhs` is the same as performing a right shift
    /// with `abs(rhs)`.
    ///
    ///     var a: UInt8 = 30                 // 0b00011110
    ///     a <<= -3
    ///     // a == 3                         // 0b00000011
    ///
    ///     var b: UInt8 = 30                 // 0b00011110
    ///     b >>= 3
    ///     // b == 3                         // 0b00000011
    ///
    /// - Parameters:
    ///   - lhs: The value to shift.
    ///   - rhs: The number of bits to shift `lhs` to the left.
    public static func <<=<Other: BinaryInteger>(lhs: inout BigInteger, rhs: Other) {
        lhs = lhs << rhs
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
        switch x.sign {
        case .plus:
            return BigInteger(sign: .minus, magnitude: x.magnitude + 1)
        case .minus:
            return BigInteger(sign: .plus, magnitude: x.magnitude - 1)
        }
    }
}
