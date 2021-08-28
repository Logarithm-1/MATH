//
//  BigInt.swift
//  Math
//
//  Created by Logan Richards on 8/26/21.
//

import Foundation

public struct BigInt: Equatable, CustomStringConvertible {
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
        
        self.source = num.reversed()
    }
    
    /// Returns a Boolean value indicating whether two values are equal
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`, `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: BigInt, rhs: BigInt) -> Bool {
        if(lhs.source.count == rhs.source.count) {
            
        }
        
        return false
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
    
    func createArrayOfZeros(of count: Int) -> [Int] {
        var arr: [Int] = [Int]()
        
        for _ in 0...count {
            arr.append(0)
        }
        
        return arr
    }
    
    func toString() -> String {
        var str: String = ""
        
        for i in 0..<source.count {
            let offset = source.count % 3
            
            if(i != 0 && i != source.count - 1 && (i - offset) % 3 == 0) {
                str += ","
            }
            str += String(source[i])
        }
        
        return str
    }
    
}
