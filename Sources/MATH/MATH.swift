//
//  File.swift
//  File
//
//  Created by Logan Richards on 10/6/21.
//

import Foundation

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
    
    //TODO: Ceil
    
    //TODO: Floor
    
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
    
    //MARK: - Addition
    //MARK: Summation
    /// The sum of all elements in an array
    public static func summation<T: AdditiveArithmetic>(_ arr: [T]) -> T {
        var sum: T = .zero
        for a in arr {
            sum += a
        }
        
        return sum
    }
    
    /// The summation is a loop that sums a certian function `f(x)` using `i` as the input. Mathematically represented by `∑_{i = start}^{end}f(i)`.
    /// - Parameters:
    ///   - start: Start of `i`
    ///   - end: End of `i`
    ///   - completion: The function that takes in `i`
    public static func summation<T: AdditiveArithmetic>(start: Int, end: Int, completion: (Int) -> T) -> T {
        assert(start <= end, "MATH.summation start must be less than end")
        var sum: T = .zero
        for i in start...end {
            sum += completion(i)
        }
        return sum
    }
    
    public static func summation<T: AdditiveArithmetic>(for elements: [T], completion: (T) -> T) -> T {
        var sum: T = .zero
        for elm in elements {
            sum += completion(elm)
        }
        return sum
    }
    
    //MARK: Factorial
    public static func factorial<Element: SignedInteger>(_ x: Element) -> Element {
        if(x <= 1) {
            return 1
        }
        
        var sum: Element = 1
        
        for i in 1...Int(x) {
            sum *= Element(i)
        }
        
        return sum
    }
    
    //MARK: Product
    /// The product is a loop that multiplies a certian function `f(x)` using `i` as the input. Mathematically represented by `∏_{i = start}^{end}f(i)`.
    /// It is the product version of the `summation ∑` function.
    /// - Parameters:
    ///   - start: Start of `i`
    ///   - end: End of `i`
    ///   - completion: The function that takes in `i`
    public static func product<T: Numeric>(start: Int, end: Int, completion: (Int) -> T) -> T {
        var prod: T = 1
        for i in start...end {
            prod *= completion(i)
        }
        return prod
    }
    
    //MARK: - Exponents
    //MARK: Power
    //FIXME: Exponet to Element
    public static func power<Element: Numeric>(_ base: Element, _ exponent: Int) -> Element {
        var result: Element = 1
        
        for _ in 0..<exponent {
            result *= base
        }
        
        return result
    }
    
    //MARK: Square Root
    public static func squareRoot<Element: BinaryInteger>(_ x: Element) -> Element {
        var result: Element =  x/2
        
        for _ in 0..<10 {
            result = (result + x/result)/2
        }
        
        return result
    }
    
    public static func squareRoot<Element: BinaryFloatingPoint>(_ x: Element) -> Element {
        var result: Element =  x/2
        
        for _ in 0..<10 {
            result = (result + x/result)/2
        }
        
        return result
    }
    
    //TODO: Cube Root
    
    //TODO: nth Root
    
    //MARK: Logarithm
    public static func logarithm<Element: BinaryFloatingPoint>(_ x: Element) -> Element {
        var y: Element = x
        var sum: Element = 0
        var divied: Element = 1
        var power: Int = 1
        
        for _ in 0..<20 {
            power = 1
            
            while(true) {
                if(y >= 1 && y < 10) {
                    y = MATH.power(y, 10)
                    divied *= 10
                    sum *= 10
                    break
                } else if(y >= MATH.power(10, power) && x < MATH.power(10, power+1)) {
                    sum += Element(power)
                    y /= MATH.power(10, power)
                    break
                }
                
                power += 1
            }
        }
        
        return sum / divied
    }
    
    public static func logarithm<Element: BinaryFloatingPoint>(_ x: Element, _ base: Element) -> Element {
        return logarithm(x) / logarithm(base)
    }
    
    public static func natralLogarithm<Element: BinaryFloatingPoint>(_ x: Element) -> Element {
        let e: Element = Element(MATH.Constants.e)
        return logarithm(x, e)
    }
    
    //MARK: - Trigonometry
    public static func degreesToRadians<Element: BinaryFloatingPoint>(_ x: Element) -> Element {
        let pi: Element = Element(MATH.Constants.π)
        return (x*pi)/180
    }
    
    public static func degreesToRadians<Element: BinaryInteger>(_ x: Element) -> Element {
        return Element(degreesToRadians(Double(x)))
    }
        
    public static func radiansToDegrees<Element: BinaryFloatingPoint>(_ x: Element) -> Element {
        let pi: Element = Element(MATH.Constants.π)
        return (x*180)/pi
    }
    
    public static func radiansToDegrees<Element: BinaryInteger>(_ x: Element) -> Element {
        return Element(radiansToDegrees(Double(x)))
    }
    
    //MARK: Sine
    public static func sine<Element: BinaryFloatingPoint>(_ radians: Element) -> Element {
        let pi: Element = Element(MATH.Constants.π)
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
    
    public static func sine<Element: BinaryInteger>(_ radians: Element) -> Element {
        return Element(sine(Double(radians)))
    }
    
    public static func sine<Element: BinaryFloatingPoint>(degrees: Element) ->  Element {
        let y = degreesToRadians(degrees)
        return sine(y)
    }
    
    public static func sine<Element: BinaryInteger>(degrees: Element) ->  Element {
        return Element(sine(degrees: Double(degrees)))
    }
    
    public static func arcSine<Element: BinaryFloatingPoint>(_ radians: Element) -> Element {
        return 1 / sine(radians)
    }
    
    public static func arcSine<Element: BinaryInteger>(_ radians: Element) -> Element {
        return Element(arcSine(Double(radians)))
    }
    
    public static func arcSine<Element: BinaryFloatingPoint>(degrees: Element) -> Element {
        return 1 / sine(degrees: degrees)
    }
    
    public static func arcSine<Element: BinaryInteger>(degrees: Element) -> Element {
        return Element(arcSine(degrees: Double(degrees)))
    }
    
    //TODO: sine Hyperbolic
    //TODO: arc Sine Hyperbolic
    
    //MARK: Cosine
    public static func cosine<Element: BinaryFloatingPoint>(_ radians: Element) -> Element {
        let pi: Element = Element(MATH.Constants.π)
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
    
    public static func cosine<Element: BinaryInteger>(_ radians: Element) -> Element {
        return Element(cosine(Double(radians)))
    }
    
    public static func cosine<Element: BinaryFloatingPoint>(degrees: Element) -> Element {
        let y = degreesToRadians(degrees)
        return cosine(y)
    }
    
    public static func cosine<Element: BinaryInteger>(degrees: Element) -> Element {
        return Element(cosine(degrees: Double(degrees)))
    }
    
    public static func arcCosine<Element: BinaryFloatingPoint>(_ radians: Element) -> Element {
        return 1 / cosine(radians)
    }
    
    public static func arcCosine<Element: BinaryInteger>(_ radians: Element) -> Element {
        return Element(arcCosine(Double(radians)))
    }
    
    public static func arcCosine<Element: BinaryFloatingPoint>(degrees: Element) -> Element {
        return 1 / cosine(degrees: degrees)
    }
    
    public static func arcCosine<Element: BinaryInteger>(degrees: Element) -> Element {
        return Element(arcCosine(degrees: Double(degrees)))
    }
    
    //TODO: cosine Hyperbolic
    //TODO: arc Cosine Hyperbolic
    
    //MARK: Tangent
    public static func tangent<Element: BinaryFloatingPoint>(_ radians: Element) -> Element {
        return sine(radians) / cosine(radians)
    }
    
    public static func tangent<Element: BinaryInteger>(_ radians: Element) -> Element {
        return Element(tangent(Double(radians)))
    }
    
    public static func tangent<Element: BinaryFloatingPoint>(degrees: Element) -> Element {
        return sine(degrees: degrees) / cosine(degrees: degrees)
    }
    
    public static func tangent<Element: BinaryInteger>(degrees: Element) -> Element {
        return Element(tangent(degrees: Double(degrees)))
    }
    
    public static func arcTangent<Element: BinaryFloatingPoint>(_ radians: Element) -> Element {
        return 1 / tangent(radians)
    }
    
    public static func arcTangent<Element: BinaryInteger>(_ radians: Element) -> Element {
        return Element(arcTangent(Double(radians)))
    }
    
    public static func arcTangent<Element: BinaryFloatingPoint>(degrees: Element) -> Element {
        return 1 / tangent(degrees: degrees)
    }
    
    public static func arcTangent<Element: BinaryInteger>(degrees: Element) -> Element {
        return Element(arcTangent(degrees: Double(degrees)))
    }
    
    //TODO: tangent Hyperbolic
    //TODO: arc tangent Hyperbolic
    
}
