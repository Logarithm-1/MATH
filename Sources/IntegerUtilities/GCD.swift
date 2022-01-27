// GCD.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/NumberTheory/blob/main/LICENSE for license information

/// In a set of whole numbers, the Greatest Common Denominator (GCD) is the largest positive integer that divides evenly into all numbers with zero remainder.
///
/// Uses the Euclidean Algorithm to solve
public func greatestCommonDenominator<Element: BinaryInteger>(_ a: Element, _ b: Element) -> Element {
    if(a == 0) {
        return b
    }
    
    return greatestCommonDenominator(b % a, a)
}

/// In a set of whole numbers, the Greatest Common Denominator Extended (GCD) is the largest positive integer that divides evenly into all numbers with zero remainder.
///
/// Uses the Euclidean Algorithm to solve
///
///     g = gcd(a, b) = ax + by
///     b%a = b - a(b / a)
///     g = (b%a)x_1 + (a)y_1 = [b - a(b / a)]x_1 + (a)y_2
///     g = b(x_1) + a[y_1 - x_1(b/a)]
///
///     x = y_1 - x_1(b/a)
///     y = x_1
///
public func greatestCommonDenominatorExtended<Element: BinaryInteger>(_ a: Element, _ b: Element) -> (gcd: Element, aCoefficient: Element, bCoefficient: Element) {
    if(a == 0) {
        return (gcd: b, aCoefficient: 0, bCoefficient: 1)
    }
    
    let ext = greatestCommonDenominatorExtended(b % a, a)
    let a_coe: Element = ext.bCoefficient - ext.aCoefficient*(b/a)
    let b_coe: Element = ext.aCoefficient
    
    print("\(ext.gcd) = \(a)*\(a_coe) + \(b)*\(b_coe) = \(a*a_coe) + \(b_coe) = \(a*a_coe + b*b_coe)")
    
    return (gcd: ext.gcd, aCoefficient: a_coe, bCoefficient: b_coe)
}
