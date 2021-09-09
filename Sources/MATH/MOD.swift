//
//  MOD.swift
//  MATH
//
//  Created by Logan Richards on 8/28/21.
//

import Foundation

//TODO: Greatest Common Denomator Tests
//TODO: Greatest Common Denomator Extended Tests
//TODO: Divison
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
    func greatestCommonDenominator(value: Element) -> Element {
        return self.greatestCommonDenominator(base, value)
    }
    
    public func greatestCommonDenominatorExtended(_ first: Element, _ second: Element, firstCoefficient: inout Element, secondCoefficient: inout Element) -> Element {
        
        if(second == 0) {
            firstCoefficient = 0
            secondCoefficient = 1
            return first
        }
        
        let gcd = greatestCommonDenominatorExtended(second, first%second, firstCoefficient: &firstCoefficient, secondCoefficient: &secondCoefficient)
        
        let temp = firstCoefficient
        firstCoefficient = secondCoefficient - (first/second)*firstCoefficient;
        secondCoefficient = temp
        
        return gcd
    }
    
    //GCDextended But first value = base value
    func greatestCommonDenominatorExtended(value: Element, firstCoefficient: inout Element, secondCoefficient: inout Element) -> Element {
        let gcd = greatestCommonDenominatorExtended(base, value, firstCoefficient: &firstCoefficient, secondCoefficient: &secondCoefficient)
        return gcd
    }
    
}
