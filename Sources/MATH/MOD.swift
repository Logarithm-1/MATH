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
        return self.greatestCommonDenominator(modulus, value)
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
        let gcd = greatestCommonDenominatorExtended(modulus, value, firstCoefficient: &firstCoefficient, secondCoefficient: &secondCoefficient)
        return gcd
    }
    
    //MARK: Prime
    public func isPrime(_ value: Element) -> Bool {
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
    
    func isPrime(x: Int) -> Bool {
        //we only need to check from i=2 to sqrt(x) for factors
        //to see if a number is prime
        let maxi: Int = Int(ceil(sqrt(Double(x))))
        for i in 2...maxi {
            //check to see if i is a factor
            if (x%i == 0){
                //i is a factor so the number is not prime
                //store the result in our array and return false
                return false
            }
        }
        return true
    }
    
    //MARK: - Arithmetic
    //MARK: Division
    public func divide(_ dividend: Element, _ divisor: Element) -> Element {
        var modCoefficient: Element = 0
        var dividendCoefficient: Element = 0
        let _ = greatestCommonDenominatorExtended(value: dividend, firstCoefficient: &modCoefficient, secondCoefficient: &dividendCoefficient)
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
        if(isPrime(modulus)) {
            let a: Element = modulus - 1
            var powerCoefficient: Element = 0
            var aCoefficient: Element = 0
            let _ = greatestCommonDenominatorExtended(power, a, firstCoefficient: &powerCoefficient, secondCoefficient: &aCoefficient)
            
            let inversePower: Element = a + aCoefficient
            return self.power(base, inversePower)
        }
        
        return Element(0)
    }
}
