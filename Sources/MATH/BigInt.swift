//
//  BigInt.swift
//  Math
//
//  Created by Logan Richards on 8/26/21.
//

import Foundation

/// A Integer that can be hundreds of digits long
public struct BigInt: Equatable, Comparable, CustomStringConvertible { //Numeric
    
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
    public static func == (lhs: BigInt, rhs: BigInt) -> Bool {
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
    
    public static func >= (lhs: BigInt, rhs: BigInt) -> Bool {
        return false
    }
    
    public static func <= (lhs: BigInt, rhs: BigInt) -> Bool {
        return false
    }
    
    public static func > (lhs: BigInt, rhs: BigInt) -> Bool {
        return false
    }
    
    public static func < (lhs: BigInt, rhs: BigInt) -> Bool {
        return false
    }
    
    //MARK: - Arithmetic
    
    public static func += (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs + rhs
    }
    
    public static func -= (lhs: inout BigInt, rhs: BigInt) {
        lhs = lhs - rhs
    }
    
    public static func *= (lhs: inout BigInt, rhs: BigInt) {
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
            let value: Int = (i < lhs.source.count ? lhs.source[i] : 0) + (i < rhs.source.count ? rhs.source[i] : 0)
            
            result.append(value)
        }
        
        return BigInt(result)
    }
    
    public static func - (lhs: BigInt, rhs: BigInt) -> BigInt {
        var result = [Int]()
        
        for i in 0..<max(lhs.source.count, rhs.source.count) {
            let value: Int = (i < lhs.source.count ? lhs.source[i] : 0) - (i < rhs.source.count ? rhs.source[i] : 0)
            
            result.append(value)
        }
        
        return BigInt(result)
    }
    ///
    ///
    ///246 * 246 = 6*246 + 40*246 + 200*246 = 1,476 + 9,840 + 49,200 = 60,516
    public static func * (lhs: BigInt, rhs: BigInt) -> BigInt {
        if(lhs.source.count > rhs.source.count) {
            var result = BigInt()
            
            for i in 0..<rhs.source.count {
                var smallResult = lhs.source
                smallResult *= rhs.source[i]
                smallResult *= 10^^i
                
                result += BigInt(smallResult)
            }
            
            return result
        } else {
            var result = BigInt()
            
            for i in 0..<lhs.source.count {
                var smallResult = rhs.source
                smallResult *= lhs.source[i]
                smallResult *= 10^^i
                
                result += BigInt(smallResult)
            }
            
            return result
        }

    }
    
    public static func / (lhs: BigInt, rhs: BigInt) -> BigInt {
        return BigInt()
    }
    
    public static func % (lhs: BigInt, rhs: BigInt) -> BigInt {
        return BigInt()
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
        source = reArange(array: source)
    }
    
    /// [1, 23, 4] -> [1, 3, 6]
    /// [1, 2, 3, 0, 0] -> [1, 2, 3]
    /// [-1, 2, 3] -> [9, 1, 3]
    /// [1, 2, -3, 4] -> [1, 2, 7, 3]
    /// [1, 2, -3] -> -[9, 8, 2]
    /// [-1, -2, -3] -> -[1, 2, 3]
    func reArange(array: [Int]) -> [Int] {
        //Make soure every element in source only has one digit
        var i = 0
        var source = array
        
        while(i < source.count) {
            if(source[i] > 9) {
                if(i + 1 >= source.count) {
                    source.append(0)
                }
                
                source[i + 1] += source[i]/10
                source[i] %= 10
            } else if(source[i] < -9) {
                if(i + 1 >= source.count) {
                    source.append(0)
                }
            }
            
            i += 1
        }
        
        //Make soure there are no leading 0's
        while(source.last == 0) {
            source.removeLast()
        }
        
        return source
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
