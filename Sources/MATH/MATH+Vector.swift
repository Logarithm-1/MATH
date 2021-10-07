//
//  Vector.swift
//  MATH
//
//  Created by Logan Richards on 9/9/21.
//

import Foundation

infix operator **  : MultiplicationPrecedence
infix operator +*  : MultiplicationPrecedence
extension MATH {
    
    struct Vector<Element: SignedNumeric & Comparable & CustomStringConvertible>: Comparable, Equatable, CustomStringConvertible {
        private var vec: [Element]
        
        public var dimensions: Int {
            get {
                return vec.count
            }
        }
        
        public var description: String {
            get {
                var d: String = "["
                for i in 0..<dimensions {
                    d += String(vec[i].description)
                    
                    if(i + 2 <= dimensions) {
                        d += ", "
                    }
                }
                
                d += "]"
                
                return d
            }
        }
        
        //MARK: - Initializers
        public init() {
            vec = [Element]()
        }
        
        public init(_ vector: [Element]) {
            vec = vector
        }
        
        public init(dimensions: Int) {
            let vector: [Element] = Array(repeating: 0, count: dimensions)
            vec = vector
        }
        
        //MARK: - Subscript
        @inlinable public subscript(index: Int) -> Element {
            get {
                return vec[index]
            }
            set(newValue) {
                vec[index] = newValue
            }
        }
        
        //MARK: - Not Too sure what to call this
        //MARK: Magnitude
        public func magnitude(from vector: Vector<Element>) -> Element {
            var sum: Element = 0
            for i in 0..<max(dimensions, vector.dimensions) {
                let value: Element = (i < dimensions ? vec[i] : 0) - (i < vector.dimensions ? vector.vec[i] : 0)
                sum += 2//FloatingPointMath.absoluteValue(value * value)
            }
            
            return 0//FIXME: NumericMath.squareRoot(sum)
        }
        
        public func magnitude() -> Element {
            var sum: Element = 0
            for i in vec {
                sum += (i * i)
            }
            
            return 0 //FIXME: NumericMath.squareRoot(sum)
        }
        
        //MARK: Diriction
        public func diriction(from vector: Vector<Element>) -> Vector {
            return self - vector
        }
        
        public func diriction() -> Vector {
            return -self
        }
        
        //MARK: Theta
        public func theta(from vector: Vector<Element>) -> Element { // From Orgin
            return 0 //atan((self.y - vector2.y) / (self.x - vector2.x))
        }
        
        public func theta() -> Element {
            return 0 //atan(self.y / self.x)
        }
        
        //MARK: - Compare
        //MARK: Equality
        public static func == (lhs: Vector, rhs: Vector) -> Bool {
            let maxDimensions: Int = max(lhs.dimensions, rhs.dimensions)
            
            for i in 0..<maxDimensions {
                let left:  Element = i < lhs.dimensions ? lhs[i] : 0
                let right: Element = i < rhs.dimensions ? rhs[i] : 0
                
                if(left != right) {
                    return false
                }
            }
            
            return true
        }
        
        //MARK: Lesser Than or Equal
        public static func <= (lhs: Vector, rhs: Vector) -> Bool {
            if(lhs == rhs) {
                return true
            }
            
            return lhs.magnitude() <= rhs.magnitude()
        }
        
        //MARK: Lesser Than
        public static func < (lhs: Vector, rhs: Vector) -> Bool {
            if(lhs == rhs) {
                return false
            }
            
            return lhs.magnitude() < rhs.magnitude()
        }
        
        //MARK: Greater Than or Equal
        public static func >= (lhs: Vector, rhs: Vector) -> Bool {
            if(lhs == rhs) {
                return true
            }
            
            return lhs.magnitude() >= rhs.magnitude()
        }
        
        //MARK: Greater Than
        public static func > (lhs: Vector, rhs: Vector) -> Bool {
            if(lhs == rhs) {
                return false
            }
            
            return lhs.magnitude() > rhs.magnitude()
        }
        
        
        //MARK: - Arithmetic
        //MARK: Addition
        public static func + (lhs: Vector, rhs: Vector) -> Vector {
            let maxDimensions: Int = max(lhs.dimensions, rhs.dimensions)
            var result: Vector = Vector(dimensions: maxDimensions)
            
            for i in 0..<maxDimensions {
                let left:  Element = i < lhs.dimensions ? lhs[i] : 0
                let right: Element = i < rhs.dimensions ? rhs[i] : 0
                result[i] = left + right
            }
            
            return result
        }
        
        public static func += (lhs: inout Vector, rhs: Vector) {
            lhs = lhs + rhs
        }
        
        //MARK: Subtraction
        public static func - (lhs: Vector, rhs: Vector) -> Vector {
            let maxDimensions: Int = max(lhs.dimensions, rhs.dimensions)
            var result: Vector = Vector(dimensions: maxDimensions)
            
            for i in 0..<maxDimensions {
                let left:  Element = i < lhs.dimensions ? lhs[i] : 0
                let right: Element = i < rhs.dimensions ? rhs[i] : 0
                result[i] = left - right
            }
            
            return result
        }
        
        public static func -= (lhs: inout Vector, rhs: Vector) {
            lhs = lhs - rhs
        }
        
        //MARK: Multiplication
        public static func * (lhs: Vector, rhs: Element) -> Vector {
            var result: Vector = lhs
            
            for i in 0..<result.dimensions {
                result[i] *= rhs
            }
            
            return result
        }
        
        public static func * (lhs: Element, rhs: Vector) -> Vector {
            return rhs * lhs
        }
        
        public static func *= (lhs: inout Vector, rhs: Element) {
            lhs = lhs * rhs
        }
        
        //MARK: Division
        public static func / (lhs: Vector, rhs: Element) -> Vector {
            var result: Vector = lhs
            
            for i in 0..<result.dimensions {
                //FIXME: Binary operator '/=' cannot be applied to two 'Element' operands
                //result[i] /= rhs
            }
            
            return result
        }
        
        public static func /= (lhs: inout Vector, rhs: Element) {
            lhs = lhs / rhs
        }
        
        //MARK: Dot Product
        public static func ** (lhs: Vector, rhs: Vector) -> Element {
            var sum: Element = 0
            
            for i in 0..<max(lhs.dimensions, rhs.dimensions) {
                let left:  Element = i < lhs.dimensions ? lhs[i] : 0
                let right: Element = i < rhs.dimensions ? rhs[i] : 0
                sum += left * right
            }
            
            return sum
        }
        
        //MARK: Cross Product
        public static func +* (lhs: Vector, rhs: Vector) -> Vector {
            
            
            return Vector()
        }
        
        //MARK: Modulus
        public static func % (lhs: Vector, rhs: Element) -> Vector {
            var result: Vector = lhs
            
            for i in 0..<result.dimensions {
                //FIXME: Binary operator '%' cannot be applied to two 'Element' operands
                //result[i] = result[i] % rhs
            }
            
            return result
        }
        
        public static func %= (lhs: inout Vector, rhs: Element) {
            lhs = lhs % rhs
        }
        
        //TODO: Power
        
        //MARK: Prefixs
        prefix public static func - (operand: Vector) -> Vector {
            var result = operand
            result.negate()
            return result
        }
        
        public mutating func negate() {
            for i in 0..<vec.count {
                vec[i] *= -1
            }
        }
        
        prefix public static func + (operand: Vector) -> Vector {
            return operand
        }
    }
}
