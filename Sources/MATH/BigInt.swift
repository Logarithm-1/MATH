//
//  BigInt.swift
//  Math
//
//  Created by Logan Richards on 8/26/21.
//

import Foundation

/// A Integer that can be hundreds of digits long
public struct BigInt: Equatable, Comparable, CustomStringConvertible { //SignedInteger
    
    /// The first element in array is an integer that represents the ones place
    /// The secound elemnts in array is an integer that represents the tens place
    ///
    /// EX. 12,345,678 -> [8, 7, 6, 5, 4, 3, 2, 1]
    ///
    /// So it is like the arry is reversed
    var source: [Int]
    var negative: Bool = false
    
    public var description: String {
        return toString()
    }
    
    init() {
        source = [0]
    }
    
    init(_ source: Int) {
        self.source = [source]
        self.reArangeArray()
    }
    
    init(_ source: [Int]) {
        self.source = source
        self.reArangeArray()
    }
    
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
    
    public static func += (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs + rhs
    }
    
    public static func += (lhs: inout BigInt, rhs: Int) {
        lhs = lhs + rhs
    }
    
    public static func -= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs - rhs
    }
    
    public static func -= (lhs: inout BigInt, rhs: Int) {
        lhs = lhs - rhs
    }
    
    public static func *= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs * rhs
    }
    
    public static func *= (lhs: inout BigInt, rhs: Int) {
        lhs = lhs * rhs
    }
    
    public static func /= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs / rhs
    }
    
    public static func %= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs % rhs
    }
    
    public static func &= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs & rhs
    }
    
    public static func |= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs | rhs
    }
    
    public static func ^= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs ^ rhs
    }
    
    public static func &>>= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs &>> rhs
    }
    
    public static func &<<= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs &<< rhs
    }
    
    public static func & (lhs: BigInt, rhs: BigInt) -> BigInt {
        return BigInt()
    }
    
    public static func | (lhs: BigInt, rhs: BigInt) -> BigInt {
        return BigInt()
    }
    
    public static func ^ (lhs: BigInt, rhs: BigInt) -> BigInt {
        return BigInt()
    }
    
    public static func &>> (lhs: BigInt, rhs: BigInt) -> BigInt {
        return BigInt()
    }
    
    public static func &<< (lhs: BigInt, rhs: BigInt) -> BigInt {
        return BigInt()
    }
    
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
    ///
    ///
    ///246 * 246 = 6*246 + 40*246 + 200*246 = 1,476 + 9,840 + 49,200 = 60,516
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
    
    /// lhs -> dividend -> Numerator
    /// rhs -> divisor -> Denemator
    /// return -> quotient
    public static func / (lhs: BigInt, rhs: BigInt) -> BigInt {
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
        
    /// 156 % 7 = 2
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
    
    /// Returns the distance from this value to the given value, expressed as a
    /// stride.
    ///
    /// For two values `x` and `y`, and a distance `n = x.distance(to: y)`,
    /// `x.advanced(by: n) == y`.
    ///
    /// - Parameter other: The value to calculate the distance to.
    /// - Returns: The distance from this value to `other`.
    public func distance(to other: BigInt) -> BigInt {
        var distance = self - other
        distance.negative = false

        return distance
    }

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
    public func advanced(by n: BigInt) -> BigInt {
        return self + n
    }
    
    public func abs() -> BigInt {
        if(negative) {
            return -self
        }
        return self
    }
    
    func factorial(n: Int) -> [Int] {
        var factorial: [Int] = [1]
        
        for i in 2...n {
            for j in 0..<factorial.count {
                factorial[j] *= i
                
                if(j != 0 && factorial[j - 1] > 9) {
                    factorial[j] += factorial[j - 1] / 10
                    factorial[j - 1] %= 10
                }
            }
            
            while(factorial.count != 0 && factorial[factorial.count - 1] > 9) {
                factorial.append(factorial[factorial.count - 1] / 10)
                factorial[factorial.count - 2] %= 10
            }
        }
        
        return factorial.reversed()
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
    
    func createArrayOfZeros(of count: Int) -> [Int] {
        var arr: [Int] = [Int]()
        
        for _ in 0...count {
            arr.append(0)
        }
        
        return arr
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
        
        for i in 0..<index {
            result *= 10
        }
        
        return result
    }
    
}

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
extension Int {
    public static func *= (lhs: inout [Int], rhs: Int) {
        for i in 0..<lhs.count {
            lhs[i] *= rhs
        }
    }
    
    public static func ^^ (radix: Int, power: Int) -> Int {
        return Int(pow(Double(radix), Double(power)))
    }
}
