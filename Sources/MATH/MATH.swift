//
//  File.swift
//  File
//
//  Created by Logan Richards on 10/6/21.
//

import Foundation

//TODO: cbrt
//TODO: ceil
//TODO: floor
//TODO: rint
//TODO: fabs

public struct MATH {
    //MARK: - Single
    //MARK: Absolute Value
    /// The magnitude of a numeric. Example -10 becomes 10
    public static func absoluteValue<T: Comparable & SignedNumeric>(_ value: T) -> T {
        if(value < 0) {
            return -value
        }
        
        return value
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
    
    /// In a set of whole numbers, the Greatest Common Denominator Extended (GCD) is the largest positive integer that divides evenly into all numbers with zero remainder.
    ///
    /// Uses the Euclidean Algorithm to solve
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
    
    //MARK: Addition
    //MARK: Summation
    /// The sum of all elements in an array
    public static func summation<T: AdditiveArithmetic>(_ arr: [T]) -> T {
        var sum: T = .zero
        for a in arr {
            sum += a
        }
        
        return sum
    }
    
    //MARK: Factorial
    public static func factorial<Element: SignedInteger>(_ x: Element) -> Element {
        var sum: Element = 1
        
        for i in 1...Int(x) {
            sum *= Element(i)
        }
        
        return sum
    }
    
    //MARK: Product
    
    //MARK: - Exponents
    //MARK: Power
    //FIXME: Exponet to Element
    public static func power<Element: FloatingPoint>(_ base: Element, _ exponent: Int) -> Element {
        var result: Element = 1
        
        for _ in 0..<exponent {
            result *= base
        }
        
        return result
    }
    
    //MARK: Square Root
    public static func squareRoot<Element: FloatingPoint>(_ x: Element) -> Element {
        var result: Element = x/2
        
        for _ in 0..<10 {
            result = (result + x/result)/2
        }
        
        return result
    }
    
    //TODO: Cube Root
    
    //TODO: nth Root
    
    //MARK: Logarithm
    public static func logarithm<Element: FloatingPoint>(_ x: Element) -> Element {
        /*var y: Element = x
        var sum: Element = 0
        var divied: Element = 1
        var power: Int = 1
        
        for _ in 0..<20 {
            power = 1
            
            while(true) {
                if(y >= 1 && y < 10) {
                    y = power(y, 10)
                    divied *= 10
                    sum *= 10
                    break
                } else if(y >= power(10, power) && x < power(10, power+1)) {
                    sum += Element(power)
                    y /= power(10, power)
                    break
                }
                
                power += 1
            }
        }
        
        return sum / divied*/
        return 0
    }
    
    public static func logarithm<Element: FloatingPoint>(_ x: Element, _ base: Element) -> Element {
        return logarithm(x) / logarithm(base)
    }
    
    public static func natralLogarithm<Element: FloatingPoint>(_ x: Element) -> Element {
        let e: Element = 3
        return logarithm(x, e)
    }
    
    //MARK: - Trigonometry
    public static func degreesToRadians<Element: FloatingPoint>(_ x: Element) -> Element {
        let pi: Element = 3
        return (x*pi)/180
    }
    
    public static func radiansToDegrees<Element: FloatingPoint>(_ x: Element) -> Element {
        let pi: Element = 3
        return (x*180)/pi
    }
    
    //MARK: Sine
    public static func sine<Element: FloatingPoint>(_ radians: Element) -> Element {
        let pi: Element = 3
        let y: Element = radians.truncatingRemainder(dividingBy: 2*pi)
        
        var sum: Element = 0
        var positive: Bool = true
        
        for i in stride(from: 1, to: 20, by: 2) {
            if(positive) {
                sum += power(y, i) / Element(MATH.factorial(i))
                positive = false
            } else {
                sum -= power(y, i) / Element(MATH.factorial(i))
                positive = true
            }
        }
        
        return sum
    }
    
    public static func sine<Element: FloatingPoint>(degrees: Element) ->  Element {
        let y = degreesToRadians(degrees)
        return sine(y)
    }
    
    public static func arcSine<Element: FloatingPoint>(_ radians: Element) -> Element {
        return 1 / sine(radians)
    }
    
    public static func arcSine<Element: FloatingPoint>(degrees: Element) -> Element {
        return 1 / sine(degrees: degrees)
    }
    
    //TODO: sine Hyperbolic
    //TODO: arc Sine Hyperbolic
    
    //MARK: Cosine
    public static func cosine<Element: FloatingPoint>(_ radians: Element) -> Element {
        let pi: Element = 3
        let y: Element = radians.truncatingRemainder(dividingBy: 2*pi)
        
        var sum: Element = 0
        var positive: Bool = true
        
        for i in stride(from: 0, to: 20, by: 2) {
            if(positive) {
                sum += power(y, i) / Element(MATH.factorial(i))
                positive = false
            } else {
                sum -= power(y, i) / Element(MATH.factorial(i))
                positive = true
            }
        }
        
        return sum
    }
    
    public static func cosine<Element: FloatingPoint>(degrees: Element) -> Element {
        let y = degreesToRadians(degrees)
        return cosine(y)
    }
    
    public static func arcCosine<Element: FloatingPoint>(_ radians: Element) -> Element {
        return 1 / cosine(radians)
    }
    
    public static func arcCosine<Element: FloatingPoint>(degrees: Element) -> Element {
        return 1 / cosine(degrees: degrees)
    }
    
    //TODO: cosine Hyperbolic
    //TODO: arc Cosine Hyperbolic
    
    //MARK: Tangent
    public static func tangent<Element: FloatingPoint>(_ radians: Element) -> Element {
        return sine(radians) / cosine(radians)
    }
    
    public static func tangent<Element: FloatingPoint>(degrees: Element) -> Element {
        return sine(degrees: degrees) / cosine(degrees: degrees)
    }
    
    public static func arcTangent<Element: FloatingPoint>(_ radians: Element) -> Element {
        return 1 / tangent(radians)
    }
    
    public static func arcTangent<Element: FloatingPoint>(degrees: Element) -> Element {
        return 1 / tangent(degrees: degrees)
    }
    
    //TODO: tangent Hyperbolic
    //TODO: arc tangent Hyperbolic
    
}
