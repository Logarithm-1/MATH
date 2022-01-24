// ModularArithmetic.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

import IntegerUtilities

/// A type that adds `modular arithmetic` or `remainder arithmetic` to a ``SignedInteger``.
public protocol ModularArithmetic: BinaryInteger {}

extension ModularArithmetic where Self : SignedInteger {
    
    /// `Modulus` (abbriviated as `MOD`) is the remainder (or the left-over) when one integer is divided by another integer. For Example:
    ///
    ///     7.modulus(3) //7 MOD 3 = 1
    ///     8.modulus(3) //8 MOD 3 = 2
    ///     9.modulus(3) //9 MOD 3 = 0
    ///     (-1).modulus(12) //-1 MOD 12 = 11
    ///
    /// - Parameter modulo: The denominator (or divisor).
    /// - Returns the remainder of a integer (`self`) divided by another integer (`modulo`).
    public func modulus(_ modulo: Self) -> Self {
        var value: Self = self
        
        if(value < 0) {//Value is negative
            //Ex: value = -45 and modulas = 26
            //-> then value % modulus = -19
            value %= modulo
            
            //-> then value + modulus = 7
            value += modulo
        }
        
        return value % modulo
    }
    
    //TODO: Should I add functions for (+, -, *, etc)
    
    //MARK: - Modular Divison
    /// Divides two integers using Modular divison.
    ///
    /// - Parameters:
    ///    - divisor: A Integer that is dividing `self`
    ///    - modulo: The base of the Modular Division.
    /// - Returns the quotient of the `dividend (self)` divided by the `divisor` using Modular divison with `modulo` as the base.
    public func divided(by divisor: Self, for modulo: Self) -> Self {
        var modCoefficient: Self = 0
        var dividendCoefficient: Self = 0
        let _ = greatestCommonDenominatorExtended(modulo, self, aCoefficient: &modCoefficient, bCoefficient: &dividendCoefficient)
        let quotient = divisor * dividendCoefficient
        return quotient.modulus(modulo)
    }
    
    //MARK: - Power
    public func power(of power: Self, for modulo: Self) -> Self {
        var value: Self = self.modulus(modulo)
        var ex: Self = power
        var product: Self = 1
        
        if(value == 0) {
             return 0
        }
        
        while(ex > 0) {
            //If power (ex) is odd
            if(ex & 1 != 0) {
                product = (product * value).modulus(modulo)
            }
            
            ex >>= 1 //ex /= 2
            value = (value*value).modulus(modulo)
        }
        
        return product
    }
    
    //TODO: Greatest Common Denominator - Extended
    public func inversePower(of power: Self, for modulo: Self) -> Self? {
        if(modulo.isPrime()) {
            let b: Self = modulo - 1
            var powerCoefficient: Self = 0
            var bCoefficient: Self = 0
            let _ = greatestCommonDenominatorExtended(power, b, aCoefficient: &powerCoefficient, bCoefficient: &bCoefficient)
            
            let inversePower: Self = b + bCoefficient
            return self.power(of: inversePower, for: modulo)
        }
        
        return nil
    }
}
