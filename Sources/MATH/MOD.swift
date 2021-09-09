//
//  MOD.swift
//  MATH
//
//  Created by Logan Richards on 8/28/21.
//

import Foundation

//TODO: Power
//TODO: Inverse Power

public struct MOD<Element: SignedInteger> {
    var base: Element
    
    //MARK: - Initalizers
    init(base: Element) {
        self.base = base
    }
    
    init() {
        self.base = 0
    }
    
    //MARK: - Math
    public func mod(_ v: Element) -> Element {
        var value = v
        
        if(value < 0) {
            value = (base + (value % base)) % base
        } else {
            value = value % base
        }
        
        return value
    }
    
    
    //MARK: Greatest Common Denominator
    /// In a set of whole numbers, the Greatest Common Denominator (GCD) is the largest positive integer that divides evenly into all numbers with zero remainder.
    ///
    /// Uses the Euclidean Algorithm to solve
    public func greatestCommonDenominator(_ first: Element, _ second: Element) -> Element {
        if(second == 0) {
            return first
        }
        
        return greatestCommonDenominator(second, first%second)
    }
    
    //GCD But first value = base value
    public func greatestCommonDenominator(value: Element) -> Element {
        return self.greatestCommonDenominator(base, value)
    }
    
    public func greatestCommonDenominatorExtended(_ first: Element, _ second: Element, firstCoefficient: inout Element, secondCoefficient: inout Element) -> Element {
        
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
    
    //GCDextended But first value = base value
    public func greatestCommonDenominatorExtended(value: Element, firstCoefficient: inout Element, secondCoefficient: inout Element) -> Element {
        let gcd = greatestCommonDenominatorExtended(base, value, firstCoefficient: &firstCoefficient, secondCoefficient: &secondCoefficient)
        return gcd
    }
    
    //MARK: - Division
    public func divide(_ dividend: Element, _ divisor: Element) -> Element {
        var modCoefficient: Element = 0
        var dividendCoefficient: Element = 0
        let _ = greatestCommonDenominatorExtended(value: dividend, firstCoefficient: &modCoefficient, secondCoefficient: &dividendCoefficient)
        let quotient = divisor * dividendCoefficient
        return mod(quotient)
    }
    
    //MARK: - Power
    public func power(_ base: Element, _ power: Element) -> Element {
        var x = mod(base)
        var y = power
        var product: Element = 1
        
        if(x == 0) {
            return 0
        }
        
        //x^y
        while(y > 0) {
            //If power is odd
            if(y & 1 != 0) {
                product = mod(product * x)
            }
            
            y >>= 1 // y = y/2
            x = mod(x * x)
        }
        
        return product
    }
}
