//
//  BigInt.swift
//  Math
//
//  Created by Logan Richards on 8/26/21.
//

import Foundation

class BigInt {
    var num: [Int] = [Int]()
    
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
    
    func createArrayOfZeros(of count: Int) -> [Int] {
        var arr: [Int] = [Int]()
        
        for _ in 0...count {
            arr.append(0)
        }
        
        return arr
    }
    
    func toString() -> String {
        var str: String = ""
        
        for i in 0..<num.count {
            let offset = num.count % 3
            
            if(i != 0 && i != num.count - 1 && (i - offset) % 3 == 0) {
                str += ","
            }
            str += String(num[i])
        }
        
        return str
    }
    
}
