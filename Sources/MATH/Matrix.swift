//
//  Matrix.swift
//  Math
//
//  Created by Logan Richards on 9/9/21.
//

import Foundation

public struct Matrix<Element: SignedNumeric> {
    let mat: [[Element]]
    
    var rows: Int {
        get {
            return mat.count
        }
    }
    
    var cols: Int {
        get {
            return (mat.count == 0 ? 0 : mat[0].count)
        }
    }
    
    //MARK: - Initializers
    public init() {
        mat = [[Element]]()
    }
    
    public init(matrix: [[Element]]) {
        mat = matrix
    }
    
    //MARK: - Compare
    //MARK: Equality
    public static func == (lhs: Matrix, rhs: Matrix) -> Bool {
        return false
    }
    
    //MARK: Lesser Than or Equal
    public static func <= (lhs: Matrix, rhs: Matrix) -> Bool {
        return false
    }
    
    //MARK: Lesser Than
    public static func < (lhs: Matrix, rhs: Matrix) -> Bool {
        return false
    }
    
    //MARK: Greater Than or Equal
    public static func >= (lhs: Matrix, rhs: Matrix) -> Bool {
        return false
    }
    
    //MARK: Greater Than
    public static func > (lhs: Matrix, rhs: Matrix) -> Bool {
        return false
    }
    
    //MARK: - Arithmetic
    //MARK: Addition
    public static func + (lhs: Matrix, rhs: Matrix) -> Matrix {
        return Matrix()
    }
    
    public static func += (lhs: inout Matrix, rhs: Matrix) {
        
    }
    
    //MARK: Subtraction
    public static func - (lhs: Matrix, rhs: Matrix) -> Matrix {
        return Matrix()
    }
    
    public static func -= (lhs: inout Matrix, rhs: Matrix) {
        
    }
    
    //MARK: Multiplication
    public static func * <T: SignedNumeric> (lhs: Matrix, rhs: T) -> Matrix {
        return Matrix()
    }
    
    public static func * <T: SignedNumeric> (lhs: T, rhs: Matrix) -> Matrix {
        return Matrix()
    }
    
    public static func *= <T: SignedNumeric> (lhs: inout Matrix, rhs: T) {
        
    }
    
    //MARK: Division
    public static func / <T: SignedNumeric> (lhs: Matrix, rhs: T) -> Matrix {
        return Matrix()
    }
    
    public static func / <T: SignedNumeric> (lhs: T, rhs: Matrix) -> Matrix {
        return Matrix()
    }
    
    public static func /= <T: SignedNumeric> (lhs: inout Matrix, rhs: T) {
        
    }
    
    //MARK: Modulus
    public static func % <T: SignedNumeric> (lhs: Matrix, rhs: T) -> Matrix {
        return Matrix()
    }
    
    public static func %= <T: SignedNumeric> (lhs: inout Matrix, rhs: T) {
        
    }
    
    //TODO: Power?
    
    //MARK: Prefixs
    prefix public static func - (operand: Matrix) -> Matrix {
        var result = operand
        result.negate()
        return result
    }
    
    public mutating func negate() {
        
    }
    
    prefix public static func + (operand: Matrix) -> Matrix {
        return operand
    }
    
    //MARK: - Misc
          
}
