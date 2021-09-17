//
//  IntegerMath.swift
//  MATH
//
//  Created by Logan Richards on 9/9/21.
//

import Foundation

/// Math functions that use Integers as inputs and outputs
public struct IntegerMath {
    @available(*, unavailable) private init() {}
    
    //MARK: Factorial
    public static func factorial<Element: SignedInteger>(_ x: Element) -> Element {
        var sum: Element = 1
        
        for i in 1...Int(x) {
            sum *= Element(i)
        }
        
        return sum
    }
    
    //MARK: Greatest Common Denominator
    /// In a set of whole numbers, the Greatest Common Denominator (GCD) is the largest positive integer that divides evenly into all numbers with zero remainder.
    ///
    /// Uses the Euclidean Algorithm to solve
    public static func greatestCommonDenominator<Element: SignedInteger>(_ first: Element, _ second: Element) -> Element {
        if(second == 0) {
            return first
        }
        
        return greatestCommonDenominator(second, first%second)
    }
    
    public static func greatestCommonDenominatorExtended<Element: SignedInteger>(_ first: Element, _ second: Element, firstCoefficient: inout Element, secondCoefficient: inout Element) -> Element {
        
        if(second == 0) {
            firstCoefficient = 1
            secondCoefficient = 0
            return first
        }
        
        let gcd = greatestCommonDenominatorExtended(second, first%second, firstCoefficient: &firstCoefficient, secondCoefficient: &secondCoefficient)
        
        let temp = secondCoefficient
        secondCoefficient = firstCoefficient - (first/second)*secondCoefficient;
        firstCoefficient = temp
        
        return gcd
    }
    
    //MARK: Prime
    public static func isPrime<Element: SignedInteger>(_ value: Element) -> Bool {
        //We only need to check from 2 to sqrt(value) for factors to see if a number is prime
        //FIXME: Will need to change this method for BigInt
        let maxFactor: Element = Element(ceil(sqrt(Double(value))))
        
        var factor: Element = 2
        while(factor <= maxFactor){
            if(value % factor == 0) {
                return false
            }
            
            if(factor == 2) {
                factor += 1
            } else {
                factor += 2
            }
        }
        
        return true
    }
    
    //MARK: Square Root
    public static func squareRoot<Element: SignedInteger>(_ value: Element) -> Element {
        if(value <= 0) {
            return 0
        }
        
        var root: Element = 0
        
        while((root*root) < value) {
            root += 1
        }
    
        if(root*root == value) {
            return root
        } else {
            root -= 1
        }
        
        return root
    }
}
