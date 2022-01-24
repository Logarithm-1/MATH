// Prime.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

/// In a set of whole numbers, a number is prime if its prime factors are 1 and it self.
public func isPrime<Element: BinaryInteger>(_ value: Element) -> Bool {
    let maxFactor: Element = value-1 //Should be the squareRoot of value
    var factor: Element = 2
    
    while(factor <= maxFactor) {
        //If value can be divided by factor (with no remainder) then value must not be prime.
        if(value % factor == 0) {
            return false
        }
        
        //If factor is Even
        if(factor & 1 != 0) {
            //Factor should be 2 (the only even prime number)
            //Thus adding one should get it to 3
            factor += 1
        } else {
            //Once the factor odd (3) we can start adding the factor by 2's since we know from 3 up, all prime numbers are odd.
            factor += 2
        }
    }
    
    //If we get to this point, we can conclude that value is prime.
    return true
}
