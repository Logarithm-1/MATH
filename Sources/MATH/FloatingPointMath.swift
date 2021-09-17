//
//  NumericMath.swift
//  MATH
//
//  Created by Logan Richards on 9/9/21.
//

import Foundation

///Numeric in -> Numeric Out
public struct FloatingPointMath {
    @available(*, unavailable) private init() {}
    
    //MARK: Constants
    public static func pi() -> Double {
        return 3.14159265358979323846264338327950288419716939937510582
    }
    
    public static func pi<Element: FloatingPoint>() -> Element {
        let r: Element = 3
        return r
    }
    
    public static func e() -> Double {
        return 2.718281828459045235360287471352662497757
    }
    
    public static func e<Element: FloatingPoint>() -> Element {
        let r: Element = 2
        return r
    }
    
    //MARK: Absolute Value
    public static func absoluteValue<Element: FloatingPoint>(_ value: Element) -> Element {
        if(value < 0) {
            return -value
        } else {
            return value
        }
    }
    
    //TODO: Summation
    
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
        var y: Element = x
        var sum: Element = 0
        var divied: Element = 1
        var power: Int = 1
        
        for _ in 0..<20 {
            power = 1
            
            while(true) {
                if(y >= 1 && y < 10) {
                    y = FloatingPointMath.power(y, 10)
                    divied *= 10
                    sum *= 10
                    break
                } else if(y >= FloatingPointMath.power(10, power) && x < FloatingPointMath.power(10, power+1)) {
                    sum += Element(power)
                    y /= FloatingPointMath.power(10, power)
                    break
                }
                
                power += 1
            }
        }
        
        return sum / divied
    }
    
    public static func logarithm<Element: FloatingPoint>(_ x: Element, _ base: Element) -> Element {
        return logarithm(x) / logarithm(base)
    }
    
    public static func natralLogarithm<Element: FloatingPoint>(_ x: Element) -> Element {
        let e: Element = FloatingPointMath.e()
        return logarithm(x, e)
    }
    
    //MARK: - Trigonometry
    public static func degreesToRadians<Element: FloatingPoint>(_ x: Element) -> Element {
        let pi: Element = FloatingPointMath.pi()
        return (x*pi)/180
    }
    
    public static func radiansToDegrees<Element: FloatingPoint>(_ x: Element) -> Element {
        let pi: Element = FloatingPointMath.pi()
        return (x*180)/pi
    }
    
    //MARK: Sine
    public static func sine<Element: FloatingPoint>(_ radians: Element) -> Element {
        let pi: Element = FloatingPointMath.pi()
        let y: Element = radians.truncatingRemainder(dividingBy: 2*pi)
        
        var sum: Element = 0
        var positive: Bool = true
        
        for i in stride(from: 1, to: 20, by: 2) {
            if(positive) {
                sum += power(y, i) / Element(IntegerMath.factorial(i))
                positive = false
            } else {
                sum -= power(y, i) / Element(IntegerMath.factorial(i))
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
        let pi: Element = FloatingPointMath.pi()
        let y: Element = radians.truncatingRemainder(dividingBy: 2*pi)
        
        var sum: Element = 0
        var positive: Bool = true
        
        for i in stride(from: 0, to: 20, by: 2) {
            if(positive) {
                sum += power(y, i) / Element(IntegerMath.factorial(i))
                positive = false
            } else {
                sum -= power(y, i) / Element(IntegerMath.factorial(i))
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

//cbrt

//ceil
//floor
//rint
//fabs
