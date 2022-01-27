// ModularArithmetic.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/NumberTheory/blob/main/LICENSE for license information

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
        let gcd = greatestCommonDenominatorExtended(modulo, self)
        let quotient = divisor * gcd.bCoefficient
        return quotient.modulus(modulo)
    }
    
    /// Returns the [multiplicative inverse of this integer in modulo `modulus` arithmetic](https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm#Modular_integers), or `nil` if there is no such number.
    ///
    ///     ab = 1 mod m
    ///     ax + my = 1 = gcd(a, m) //Thus gcd(a, m) must equal 1
    ///     ax - 1 = (-y)m
    ///     ax = 1 mod m
    ///
    /// - Parameter modulo: The base of the Modular Inverse
    /// - Returns: If `gcd(self, modulus) == 1`, the value returned is an integer `a < modulus` such that `(a * self) % modulus == 1`. If `self` and `modulus` aren't coprime, the return value is `nil`.
    /// - Requires: `modulus.magnitude > 1`
    /// - Complexity: `O(count^3)`
    public func inverse(for modulo: Self) -> Self? {
        guard modulo > 1 else {
            return nil
        }
        
        let gcd = greatestCommonDenominatorExtended(self, modulo)
        guard gcd.gcd == 1 else {
            return nil
        }
        
        return gcd.aCoefficient.modulus(modulo)
    }
    
    //MARK: - Power
    /// Returns the remainder of this integer raised to the power `exponent` in modulo arithmetic under `modulo`.
    ///
    /// Uses the [right-to-left binary method]( https://en.wikipedia.org/wiki/Modular_exponentiation#Right-to-left_binary_method)
    ///
    /// - Parameters:
    ///    - power: The exponent of the operation.
    ///    - modulo: The base of the operation.
    /// - Returns: `self^power mod modulo`
    /// - Complexity: `O(exponent.count * modulus.count^log2(3))`
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
    
    public func inversePower(of power: Self, for modulo: Self) -> Self? {
        if(modulo.isPrime()) {
            let gcd = greatestCommonDenominatorExtended(power, modulo - 1)
            let inversePower = (modulo - 1) + gcd.bCoefficient
            return self.power(of: inversePower, for: modulo)
        }
        
        return nil
    }
}
