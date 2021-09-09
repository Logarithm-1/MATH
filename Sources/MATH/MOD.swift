//
//  MOD.swift
//  MATH
//
//  Created by Logan Richards on 8/28/21.
//

import Foundation

//TODO: Fix Inverse Power

public struct MOD<Element: SignedInteger> {
    var modulus: Element
    
    //MARK: - Initalizers
    init(modulus: Element) {
        self.modulus = modulus
    }
    
    init() {
        self.modulus = 0
    }
    
    //MARK: - Math
    public func mod(_ v: Element) -> Element {
        var value = v
        
        if(value < 0) {
            value = (modulus + (value % modulus)) % modulus
        } else {
            value = value % modulus
        }
        
        return value
    }
    
    //MARK: - Arithmetic
    //MARK: Division
    public func divide(_ dividend: Element, _ divisor: Element) -> Element {
        var modCoefficient: Element = 0
        var dividendCoefficient: Element = 0
        let _ = IntegerMath.greatestCommonDenominatorExtended(modulus, dividend, firstCoefficient: &modCoefficient, secondCoefficient: &dividendCoefficient)
        let quotient = divisor * dividendCoefficient
        return mod(quotient)
    }
    
    //MARK: Power
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
    
    //MARK: Inverse Power
    func inversePower(_ base: Element, _ power: Element) -> Element {
        if(IntegerMath.isPrime(modulus)) {
            let a: Element = modulus - 1
            var powerCoefficient: Element = 0
            var aCoefficient: Element = 0
            let _ = IntegerMath.greatestCommonDenominatorExtended(power, a, firstCoefficient: &powerCoefficient, secondCoefficient: &aCoefficient)
            
            let inversePower: Element = a + aCoefficient
            return self.power(base, inversePower)
        }
        
        return Element(0)
    }
}
