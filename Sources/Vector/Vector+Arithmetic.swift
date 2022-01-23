// Vector+Arithmetic.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

extension Vector {
    public mutating func negate() {
        for i in 0..<dimensions {
            self[i] *= -1
        }
    }
    
    prefix public static func -(operand: Vector) -> Vector {
        var result = operand
        result.negate()
        return result
    }
    
    prefix public static func +(operand: Vector) -> Vector {
        return operand
    }
}


extension Vector: AdditiveArithmetic {
    public static var zero: Vector<Element> {
        return Vector(dimensions: 2)
    }
    
    //MARK: - Addition
    /// Adds two vectors and produces their sum.
    ///
    /// The addition operator (`+`) calculates the sum of its two vectors by adding each aligning component . For example:
    ///
    ///     <1, 2> + <3, 5> = <1 + 3, 2 + 5> = <4, 7>
    ///
    /// - Parameters:
    ///   - lhs: The first vector to add.
    ///   - rhs: The second vector to add.
    /// - Returns: The sum of two vectors, `lhs` and `rhs`
    public static func +(lhs: Vector<Element>, rhs: Vector<Element>) -> Vector<Element> {
        var result: Vector = Vector<Element>()
        
        for i in 0..<max(lhs.dimensions, rhs.dimensions) {
            print(lhs[i], rhs[i])
            result[i] = lhs[i] + rhs[i]
        }
        
        return result
    }
    
    /// Adds two vectors and stores the result in the left-hand-side variable.
    ///
    /// The sum of the two arguments must be representable in the arguments' type.
    ///
    /// - Parameters:
    ///   - lhs: The first vector to add and store sum.
    ///   - rhs: The second vector to add.
    public static func +=(lhs: inout Vector<Element>, rhs: Vector<Element>) {
        lhs = lhs + rhs
    }
    
    //MARK: - Subtraction
    /// Subtracts one vector from another and produces their difference.
    ///
    /// The subtraction operator (`-`) calculates the difference of the aligning components. For example:
    ///
    ///     <1, 2> - <3, 5> = <1 - 3, 2 - 5> = <-2, -3>
    ///
    /// - Parameters:
    ///   - lhs: A vector.
    ///   - rhs: The vector to subtract from `lhs`.
    public static func -(lhs: Vector<Element>, rhs: Vector<Element>) -> Vector<Element> {
        var result: Vector = Vector<Element>()
        
        for i in 0..<max(lhs.dimensions, rhs.dimensions) {
            result[i] = lhs[i] - rhs[i]
        }
        
        return result
    }
    
    /// Subtracts the second vector from the first and stores the difference in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: A vector and store subtraction.
    ///   - rhs: The vector to subtract from `lhs`.
    public static func -=(lhs: inout Vector<Element>, rhs: Vector<Element>) {
        lhs = lhs - rhs
    }
}

extension Vector {
    //MARK: Multiplication
    /// Multiplies a vector and a scalar (Numeric) and produces their product.
    ///
    /// The multiplication operator (`*`) calculates the product of each vector component by the scalar. For example:
    ///
    ///     <2, 5, 3> * 3 = <2*3, 5*3, 3*3> = <6, 15, 9>
    ///
    /// - Parameters:
    ///   - lhs: The vector to multiply.
    ///   - rhs: The scalar to multiply.
    public static func *(lhs: Vector<Element>, rhs: Element) -> Vector<Element> {
        var result: Vector = Vector<Element>()
        
        for i in 0..<lhs.dimensions {
            result[i] = lhs[i] * rhs
        }
        
        return result
    }
    
    /// Multiplies a vector and a scalar (Numeric) and produces their product.
    ///
    /// The multiplication operator (`*`) calculates the product of each vector component by the scalar. For example:
    ///
    ///     3 * <2, 5, 3> = <2*3, 5*3, 3*3> = <6, 15, 9>
    ///
    /// - Parameters:
    ///   - lhs: The scalar to multiply.
    ///   - rhs: The vector to multiply.
    public static func *(lhs: Element, rhs: Vector<Element>) -> Vector<Element> {
        var result: Vector = Vector<Element>()
        
        for i in 0..<rhs.dimensions {
            result[i] = lhs * rhs[i]
        }
        
        return result
    }
    
    /// Multiplies a vector by a scalar and stores the result in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: The vector multiply.
    ///   - rhs: The scalar to multiply.
    public static func *=(lhs: inout Vector<Element>, rhs: Element) {
        lhs = lhs * rhs
    }
    
    //MARK: - Divison
    /// Divides a vector by a scalar (Numeric) and produces their product.
    ///
    ///     <2, 5, 3> / 3 = <2/3, 5/3, 3/3> = <0.66, 1.66, 1>
    ///
    /// - Parameters:
    ///   - lhs: The vector to multiply.
    ///   - rhs: The scalar to multiply.
    public static func /(lhs: Vector<Element>, rhs: Element) -> Vector<Element> {
        var result: Vector = Vector<Element>()
        
        for i in 0..<lhs.dimensions {
            result[i] = lhs[i] / rhs
        }
        
        return result
    }
    
    /// Divides a vector and a scalar (Numeric).
    ///
    ///     3 / <2, 5, 3> = <3/2, 3/5, 3/3> = <1.5, 0.6, 1>
    ///
    /// - Parameters:
    ///   - lhs: The scalar to be divided.
    ///   - rhs: The vector to of which componets are to divide `lhs`.
    public static func /(lhs: Element, rhs: Vector<Element>) -> Vector<Element> {
        var result: Vector = Vector<Element>()
        
        for i in 0..<rhs.dimensions {
            result[i] = lhs / rhs[i]
        }
        
        return result
    }
    
    /// Divides a vector by a scalar and stores the result in the left-hand-side variable.
    ///
    /// - Parameters:
    ///   - lhs: The vector to be divided.
    ///   - rhs: The scalar to divide `lhs`.
    public static func /=(lhs: inout Vector<Element>, rhs: Element) {
        lhs = lhs / rhs
    }
    
    //TODO: - Modulus
}

infix operator •* : MultiplicationPrecedence
extension Vector {
    //MARK: - Dot Product
    /// Does the vector operation `Dot Product` on two vectors.
    ///
    /// - Parameters:
    ///   - lhs: The first vector.
    ///   - rhs: The second vector.
    public static func •*(lhs: Vector<Element>, rhs: Vector<Element>) -> Element {
        var sum: Element = 0
        
        //We can just look at the minimum of dimensions since any dimensions greater than the minimun whould be zero.
        //<1, 2> •* <3, 4, 5> = (1 * 3) + (2 * 4) + (0 * 5) = 3 + 8 + 0 = 11
        //<1, 2> •* <3, 4>    = (1 * 3) + (2 * 4)           = 3 + 8     = 11
        for i in 0..<min(lhs.dimensions, rhs.dimensions) {
            sum += lhs[i] * rhs[i]
        }
        
        return sum
    }
}

infix operator +* : MultiplicationPrecedence
extension Vector {
    //MARK: - Cross Product
    /// Does the vector operation `Cross Product` on two vectors.
    ///
    /// - Parameters:
    ///   - lhs: The first vector.
    ///   - rhs: The second vector.
    public static func +*(lhs: Vector<Element>, rhs: Vector<Element>) -> Vector<Element> {
        //TODO: Vecotr Cross Pruduct in different dimensions
        assert(lhs.compactDimensions <= 3 && rhs.compactDimensions <= 3, "To do a cross product, both vectors must be 3D or 2D")
        
        var result: Vector = Vector<Element>()
        
        result.x = (lhs.y * rhs.z) - (lhs.z * rhs.y)
        result.y = (lhs.z * rhs.x) - (lhs.x * rhs.z)
        result.z = (lhs.x * rhs.y) - (lhs.y * rhs.x)
        
        return result
    }
}
