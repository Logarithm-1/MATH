// GCD.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

/// In a set of whole numbers, the Greatest Common Denominator (GCD) is the largest positive integer that divides evenly into all numbers with zero remainder.
///
/// Uses the Euclidean Algorithm to solve
public func greatestCommonDenominator<Element: BinaryInteger>(_ a: Element, _ b: Element) -> Element {
    if(b == 0) {
        return a
    }
    
    return greatestCommonDenominator(b, a % b)
}

/// In a set of whole numbers, the Greatest Common Denominator Extended (GCD) is the largest positive integer that divides evenly into all numbers with zero remainder.
///
/// Uses the Euclidean Algorithm to solve
public func greatestCommonDenominatorExtended<Element: BinaryInteger>(_ a: Element, _ b: Element, aCoefficient: inout Element, bCoefficient: inout Element) -> Element {
    
    if(b == 0) {
        aCoefficient = 1
        bCoefficient = 0
        return a
    }
    
    let gcd = greatestCommonDenominatorExtended(b, a % b, aCoefficient: &aCoefficient, bCoefficient: &bCoefficient)
    
    let temp = bCoefficient
    bCoefficient = aCoefficient - (a/b) * bCoefficient
    aCoefficient = temp
    
    return gcd
}
