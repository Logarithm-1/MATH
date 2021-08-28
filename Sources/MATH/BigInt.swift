//
//  BigInt.swift
//  Math
//
//  Created by Logan Richards on 8/26/21.
//

import Foundation

/// A Integer that can be hundreds of digits long
public struct BigInt: Equatable, CustomStringConvertible {
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
        var num: [Int] = [source]
        
        while(num.count != 0 && num[num.count - 1] > 9) {
            num.append(num[num.count - 1] / 10)
            num[num.count - 2] %= 10
        }
        
        self.source = num
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
        
    }
    
    public static func -= (lhs: inout BigInt, rhs: BigInt) {
        
    }
    
    public static func *= (lhs: inout BigInt, rhs: BigInt) {
        
    }
    
    public static func /= (lhs: inout BigInt, rhs: BigInt) {
        
    }
    
    public static func %= (lhs: inout BigInt, rhs: BigInt) {
        
    }
    
    public static func &= (lhs: inout BigInt, rhs: BigInt) {
        
    }
    
    public static func |= (lhs: inout BigInt, rhs: BigInt) {
        
    }
    
    public static func ^= (lhs: inout BigInt, rhs: BigInt) {
        
    }
    
    public static func &>>= (lhs: inout BigInt, rhs: BigInt) {
        
    }
    
    public static func &<<= (lhs: inout BigInt, rhs: BigInt) {
        
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
        return BigInt()
    }
    
    public static func - (lhs: BigInt, rhs: BigInt) -> BigInt {
        return BigInt()
    }
    
    public static func * (lhs: BigInt, rhs: BigInt) -> BigInt {
        return BigInt()
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
    
    func addition(_ left: [Int], _ right: [Int]) -> [Int] {
        var sum: [Int] = createArrayOfZeros(of: max(left.count, right.count))
        
        let leftRe: [Int] = left.reversed()
        let rightRe: [Int] = right.reversed()
        
        for i in 0..<max(leftRe.count, rightRe.count) {
            let value: Int = (i < leftRe.count ? leftRe[i] : 0) + (i < rightRe.count ? rightRe[i] : 0)
            
            sum[i] += value
            
            if(sum[i] > 10) {
                sum[i + 1] += (sum[i] / 10)
                sum[i] %= 10
            }
        }
        
        var sumRe: [Int] = sum.reversed()
        
        while(sumRe.count > 1 && sumRe.first == 0) {
            sumRe.remove(at: 0)
        }
        
        return sumRe
    }
    
    func intToArray(_ x: Int) -> [Int] {
        var num: [Int] = [x]
        
        while(num.count != 0 && num[num.count - 1] > 9) {
            num.append(num[num.count - 1] / 10)
            num[num.count - 2] %= 10
        }
        
        return num
    }
    
    /// [1, 23, 4] -> [3, 3, 4]
    /// [1, 2, 3, 0, 0] -> [1, 2, 3]
    func reArangeArray() {
        
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
