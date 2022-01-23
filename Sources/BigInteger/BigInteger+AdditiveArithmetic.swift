// BigInteger+AdditiveArithmetic.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

extension BigInteger: AdditiveArithmetic {
    public static var zero: BigInteger {
        return BigInteger()
    }
    
    //MARK: - Addition
    public static func + (lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        var result: BigInteger = BigInteger()
        
        
        for bitIndex in 0..<max(lhs.bitWidth, rhs.bitWidth) {
            //TODO: Figure out Negative BigIntegers
            if(lhs[bitIndex] || rhs[bitIndex]) {
                result[bitIndex] = false
                var index: Int = bitIndex + (lhs[bitIndex] && rhs[bitIndex] ? 1 : 0)
                while(result[index]) {
                    result[index] = false
                    index += 1
                }
                result[index] = true
            }
        }
        
        
        
        return BigInteger()
    }
    
    //MARK: - Subtraction
    public static func - (lhs: BigInteger, rhs: BigInteger) -> BigInteger {
        return BigInteger()
    }
}
