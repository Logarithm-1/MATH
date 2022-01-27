// Prime.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/NumberTheory/blob/main/LICENSE for license information

extension BinaryInteger {
    /// In a set of whole numbers, a number is prime if its prime factors are 1 and it self.
    public func isPrime() -> Bool {
        if(self == 2) {
            return true
        } else if(self & 1 == 0) { //self is positive
            return false
        }
        
        // Quickly check for small primes.
        let smallPrimes: [Self] = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41]
        
        for prime in smallPrimes {
            if(self == prime) {
                //self is a small prime
                return true
            } else if(self % prime == 0) {
                //self is multiple of a prime, thus can't be a prime.
                return false
            }
        }
        
        
        
        
        
        
        //TODO: maxFactor should be the sqrt(self)
        let maxFactor: Self = self - 1
        var factor: Self = 2
        
        while(factor <= maxFactor) {
            //If value can be divided by factor (with no remainder) then value must not be prime.
            if(self % factor == 0) {
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
}
