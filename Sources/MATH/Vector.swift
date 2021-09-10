//
//  Vector.swift
//  MATH
//
//  Created by Logan Richards on 9/9/21.
//

import Foundation

infix operator **  : MultiplicationPrecedence
infix operator **= : MultiplicationPrecedence
infix operator +*  : MultiplicationPrecedence
infix operator +*= : MultiplicationPrecedence
struct Vector<Element: SignedNumeric> {
    var vec: [Element]
    
    var dimensions: Int {
        get {
            return vec.count
        }
    }
    
    //MARK: - Initializers
    public init() {
        vec = [Element]()
    }
    
    public init(vector: [Element]) {
        vec = vector
    }
    
    //MARK: - Not Too sure what to call this
    //MARK: Magnitude
    public func magnitude(from vector: Vector<Element>) -> Element {
        return 0
    }
    
    public func magnitude() -> Element {
        return 0
    }
    
    //MARK: Diriction
    public func diriction(from vector: Vector<Element>) -> Vector {
        return self
    }
    
    public func diriction() -> Vector {
        return self
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
        return false
    }
    
    //MARK: Lesser Than or Equal
    public static func <= (lhs: Vector, rhs: Vector) -> Bool {
        return false
    }
    
    //MARK: Lesser Than
    public static func < (lhs: Vector, rhs: Vector) -> Bool {
        return false
    }
    
    //MARK: Greater Than or Equal
    public static func >= (lhs: Vector, rhs: Vector) -> Bool {
        return false
    }
    
    //MARK: Greater Than
    public static func > (lhs: Vector, rhs: Vector) -> Bool {
        return false
    }
    
    
    //MARK: - Arithmetic
    //MARK: Addition
    public static func + (lhs: Vector, rhs: Vector) -> Vector {
        return Vector()
    }
    
    public static func += (lhs: inout Vector, rhs: Vector) {
        
    }
    
    //MARK: Subtraction
    public static func - (lhs: Vector, rhs: Vector) -> Vector {
        return Vector()
    }
    
    public static func -= (lhs: inout Vector, rhs: Vector) {
        
    }
    
    //MARK: Multiplication
    public static func * <T: SignedNumeric>(lhs: Vector, rhs: T) -> Vector {
        return Vector()
    }
    
    public static func * <T: SignedNumeric>(lhs: T, rhs: Vector) -> Vector {
        return Vector()
    }
    
    public static func *= <T: SignedNumeric>(lhs: inout Vector, rhs: T) {
        
    }
    
    //MARK: Division
    public static func / <T: SignedNumeric>(lhs: Vector, rhs: T) -> Vector {
        return Vector()
    }
    
    public static func / <T: SignedNumeric>(lhs: T, rhs: Vector) -> Vector {
        return Vector()
    }
    
    public static func /= <T: SignedNumeric>(lhs: inout Vector, rhs: T) {
        
    }
    
    //MARK: Dot Multiplication
    public static func ** (lhs: Vector, rhs: Vector) -> Vector {
        return Vector()
    }
    
    public static func **= (lhs: inout Vector, rhs: Vector) {
        
    }
    
    //MARK: Cross Multiplication
    public static func +* (lhs: Vector, rhs: Vector) -> Vector {
        return Vector()
    }
    
    public static func +*= (lhs: inout Vector, rhs: Vector) {
        
    }
    
    //TODO: Power
    
    //MARK: Modulus
    public static func % <T: SignedInteger>(lhs: Vector, rhs: T) -> Vector {
        return Vector()
    }
    
    public static func %= <T: SignedInteger>(lhs: inout Vector, rhs: T) {
        
    }
    
    //MARK: Prefixs
    prefix public static func - (operand: Vector) -> Vector {
        var result = operand
        result.negate()
        return result
    }
    
    public mutating func negate() {
        
    }
    
    prefix public static func + (operand: Vector) -> Vector {
        return operand
    }
    
    //MARK: - Misc
    public func matchDimensions(vec1: inout Vector, vec2: inout Vector) {
        
    }
}
