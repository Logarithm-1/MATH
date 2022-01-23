// ModularArithmetic.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

/// A type that adds a modulus to integers.
public protocol ModularArithmetic: SignedInteger {}

extension ModularArithmetic {
    public func mod(_ modulus: Self) -> Self {
        var value: Self = self
        
        if(value < 0) {//Value is negative
            //Ex: value = -45 and modulas = 26
            //-> then value % modulus = -19
            value %= modulus
            
            //-> then value + modulus = 7
            value += modulus
        }
        
        return value % modulus
    }
    
    //TODO: Greatest Common Denominator - Extended
    public func divided(by divisor: Self, for modulus: Self) -> Self {
        return 0
    }
    
    //MARK: - Powers
    public func power(of power: Self, for modulus: Self) -> Self {
        var value: Self = self.mod(modulus)
        var ex: Self = power
        var product: Self = 1
        
        if(value == 0) {
             return 0
        }
        
        while(ex > 0) {
            //If power (ex) is odd
            if(ex & 1 != 0) {
                product = (product * value).mod(modulus)
            }
            
            ex >>= 1 //ex /= 2
            value = (value*value).mod(modulus)
        }
        
        return product
    }
    
    //TODO: Greatest Common Denominator - Extended
    public func inversePower(of power: Self, for modulus: Self) -> Self {
        return 0
    }
}
