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
    
    /// A  `Vector` is a mathetical was to discribe both a magnitude and a direction.
    public struct Vector<Element: Numeric & CustomStringConvertible>: Equatable, CustomStringConvertible {
        
        /// The `components` are how much the vector point's in each deriction `(x, y, z, w,...)`.
        public var components: [Element]
        
        public var description: String {
            get {
                var d: String = "<"
                for i in 0..<dimensions {
                    d += String(components[i].description)
                    
                    if(i + 2 <= dimensions) {
                        d += ", "
                    }
                }
                
                d += ">"
                
                return d
            }
        }
        
        //TODO: Unit Vector
        
        //MARK: - Initializers
        public init() {
            components = [Element]()
        }
        
        public init(_ vector: [Element]) {
            components = vector
        }
        
        public init(magnitude: Int, angle: Double) {
            components = [Element]()
        }
        
        public init(dimensions: Int) {
            let vector: [Element] = Array(repeating: 0, count: dimensions)
            components = vector
        }
        
        //MARK: - Modifiers
        public var x: Element {
            get {
                if(components.count >= 1) {
                    return components[0]
                }
                return 0
            }
            
            set {
                while(components.count < 1) {
                    components.append(0)
                }
                components[0] = newValue
            }
        }
        
        public var y: Element {
            get {
                if(components.count >= 2) {
                    return components[1]
                }
                
                return 0
            }
            
            set {
                while(components.count < 2) {
                    components.append(0)
                }
                components[1] = newValue
            }
        }
        
        public var z: Element {
            get {
                if(components.count >= 3) {
                    return components[2]
                }
                
                return 0
            }
            
            set {
                while(components.count < 3) {
                    components.append(0)
                }
                components[2] = newValue
            }
        }
        
        public var w: Element {
            get {
                if(components.count >= 4) {
                    return components[3]
                }
                
                return 0
            }
            
            set {
                while(components.count < 4) {
                    components.append(0)
                }
                components[3] = newValue
            }
        }
        
        public var dimensions: Int {
            get {
                return components.count
            }
            
            set {
                while(components.count < newValue) {
                    components.append(0)
                }
                
                while(components.count > newValue) {
                    components.removeLast()
                }
            }
        }
        
        public var nonZeroTrailingDimensions: Int {
            get {
                var count: Int = 0
                var index: Int = components.count - 1
                
                //Remove dimensions that are zero if they are trailing
                //EX. <1, 2, 0, 0, 0> has 2D
                //EX. <0, 0, 3> has 3D
                //EX. <1, 2, 0, 0, 3> has 5D
                while(index > 0 && components[index] == 0) {
                    index -= 1
                    count += 1
                }
                
                return components.count - count
            }
        }
        
        //MARK: Subscript
        @inlinable public subscript(index: Int) -> Element {
            get {
                return components[index]
            }
            set(newValue) {
                components[index] = newValue
            }
        }
        
        //MARK: Scale
        public mutating func scale(by scalar: Element) {
            self *= scalar
        }
        
        //TODO: Rotate
        
        //MARK: - Other
        //MARK: Magnitude
        public func magnitudeSquared() -> Element {
            return MATH.summation(for: components) { i in i*i}
        }
        
        public func magnitude() -> Element {
            fatalError("Can't do magnitude if Element is not a BinaryInteger or BinaryFloatingPoint")
        }
        
        public func magnitude() -> Element where Element: BinaryInteger {
            return MATH.squareRoot(magnitudeSquared())
        }
        
        public func magnitude() -> Element where Element: BinaryFloatingPoint {
            return MATH.squareRoot(magnitudeSquared())
        }
        
        //MARK: Direction
        public func direction() -> Vector {
            return -self
        }
        
        public func direction(from vector: Vector<Element>) -> Vector {
            return self - vector
        }
        
        //MARK: Theta
        public func theta() -> Element {
            fatalError("Can't do theta if Element is not a BinaryInteger or BinaryFloatingPoint")
        }
        
        public func theta() -> Element where Element: BinaryInteger {
            assert(nonZeroTrailingDimensions < 3, "Can't do theta if Vector is 3+D")
            return MATH.arcTangent(x / x)
        }
        
        public func theta() -> Element where Element: BinaryFloatingPoint {
            assert(nonZeroTrailingDimensions < 3, "Can't do theta if Vector is 3+D")
            return MATH.arcTangent(x / x)
        }
        
        //MARK: Distance From
        public func distance(from vector: Vector<Element>) {
            fatalError("Can't do distance from if Element is not a BinaryInteger or BinaryFloatingPoint")
        }
        
        public func distance(from vector: Vector<Element>) -> Element where Element: BinaryInteger {
            let diff: Vector = self - vector
            return diff.magnitude()
        }
        
        public func distance(from vector: Vector<Element>) -> Element where Element: BinaryFloatingPoint {
            let diff: Vector = self - vector
            return diff.magnitude()
        }
        
        //MARK: Angle From
        public func angle(from vector: Vector<Element>) -> Element {
            fatalError("Can't do angle from if Element is not a BinaryInteger or BinaryFloatingPoint")
        }
        
        public func angle(from vector: Vector<Element>) -> Element where Element: BinaryInteger {
            return MATH.arcTangent((y - vector.y) / (x - vector.x))
        }
        
        public func angle(from vector: Vector<Element>) -> Element where Element: BinaryFloatingPoint {
            return MATH.arcTangent((y - vector.y) / (x - vector.x))
        }
        
        //TODO: Is Parallel To
        public func isParallel(to vector: Vector<Element>) -> Bool {
            return false
        }
        
        //TODO: Is Antiparallel To
        public func isAntiParallel(to vector: Vector<Element>) -> Bool {
            return false
        }
        
        //TODO: Is Perpendicular To
        public func isPerpendicular(to vector: Vector<Element>) -> Bool {
            return false
        }
        
        //TODO: Lies on Line
        //TODO: Lies in Plane
        
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
            fatalError("Can't do division if Element is not a BinaryInteger or BinaryFloatingPoint")
        }
        
        public static func / (lhs: Vector, rhs: Element) -> Vector where Element: BinaryInteger {
            var result: Vector = lhs
            
            for i in 0..<result.dimensions {
                result[i] /= rhs
            }
            
            return result
        }
        
        public static func / (lhs: Vector, rhs: Element) -> Vector where Element: BinaryFloatingPoint {
            var result: Vector = lhs
            
            for i in 0..<result.dimensions {
                result[i] /= rhs
            }
            
            return result
        }
        
        public static func /= (lhs: inout Vector, rhs: Element) {
            fatalError("Can't do division if Element is not a BinaryInteger or BinaryFloatingPoint")
        }
        
        public static func /= (lhs: inout Vector, rhs: Element) where Element: BinaryInteger {
            lhs = lhs / rhs
        }
        
        public static func /= (lhs: inout Vector, rhs: Element) where Element: BinaryFloatingPoint {
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
        //TODO: Vector Cross Product in higher dimensions (4+)
        public static func +* (lhs: Vector, rhs: Vector) -> Vector {
            assert(lhs.nonZeroTrailingDimensions <= 3 && rhs.nonZeroTrailingDimensions <= 3)
            
            var result: Vector = Vector(dimensions: 3)
            
            result.x = (lhs.y * rhs.z) - (lhs.z * rhs.y)
            result.y = (lhs.z * rhs.x) - (lhs.x * rhs.z)
            result.z = (lhs.x * rhs.y) - (lhs.y * rhs.x)
            
            return result
        }
        
        //MARK: Modulus
        public static func % (lhs: Vector, rhs: Element) -> Vector {
            fatalError("Can't do division if Element is not a BinaryInteger or BinaryFloatingPoint")
        }
        
        public static func % (lhs: Vector, rhs: Element) -> Vector where Element: BinaryInteger {
            var result: Vector = lhs
            
            for i in 0..<result.dimensions {
                result[i] = result[i] % rhs
            }
            
            return result
        }
        
        public static func % (lhs: Vector, rhs: Element) -> Vector where Element: BinaryFloatingPoint {
            var result: Vector = lhs
            
            for i in 0..<result.dimensions {
                result[i] = result[i].truncatingRemainder(dividingBy: rhs)
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
            for i in 0..<components.count {
                components[i] *= -1
            }
        }
        
        prefix public static func + (operand: Vector) -> Vector {
            return operand
        }
    }
}
