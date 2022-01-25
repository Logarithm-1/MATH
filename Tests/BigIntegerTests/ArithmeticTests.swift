// ArithmeticTests.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

import XCTest
@testable import BigInteger

final class ArithmeticTests: XCTestCase {
    func testAddingTwoIntegers(_ x: Int, _ y: Int) {
        let bigInt: BigInteger = BigInteger(x) + BigInteger(y)
        XCTAssertEqual(bigInt, BigInteger(x + y))
        
        let bigUInt: BigUInteger = BigUInteger(UInt(x)) + BigUInteger(UInt(y))
        XCTAssertEqual(bigUInt, BigUInteger(UInt(x + y)))
    }
    
    func testSubtractingTwoIntegers(_ x: Int, _ y: Int) {
        let bigInt: BigInteger = BigInteger(x) - BigInteger(y)
        XCTAssertEqual(bigInt, BigInteger(x - y))
        
        if(x - y >= 0) {
            let bigUInt: BigUInteger = BigUInteger(UInt(x)) - BigUInteger(UInt(y))
            XCTAssertEqual(bigUInt, BigUInteger(UInt(x - y)))
        }
    }
    
    func testMultiplyingTwoIntegers(_ x: Int, _ y: Int) {
        let bigInt: BigInteger = BigInteger(x) * BigInteger(y)
        XCTAssertEqual(bigInt, BigInteger(x * y))
        
        let bigUInt: BigUInteger = BigUInteger(UInt(x)) * BigUInteger(UInt(y))
        XCTAssertEqual(bigUInt, BigUInteger(UInt(x * y)))
    }
    
    func testDividingTwoIntegers(_ x: Int, _ y: Int) {
        let bigInt: BigInteger = BigInteger(x) / BigInteger(y)
        XCTAssertEqual(bigInt, BigInteger(x / y))
        
        let bigUInt: BigUInteger = BigUInteger(UInt(x)) / BigUInteger(UInt(y))
        XCTAssertEqual(bigUInt, BigUInteger(UInt(x / y)))
    }
    
    func testModingTwoIntegers(_ x: Int, _ y: Int) {
        let bigInt: BigInteger = BigInteger(x) % BigInteger(y)
        XCTAssertEqual(bigInt, BigInteger(x % y))
        
        let bigUInt: BigUInteger = BigUInteger(UInt(x)) % BigUInteger(UInt(y))
        XCTAssertEqual(bigUInt, BigUInteger(UInt(x % y)))
    }
    
    func testPoweringTwoIntegers(_ x: Int, _ y: Int) {
        
    }
    
    func testAdding() {
        testAddingTwoIntegers(5, 3)
        testAddingTwoIntegers(324, 21)
        testAddingTwoIntegers(5233, 36432)
        testAddingTwoIntegers(5865, 343)
    }
    
    func testSubtracting() {
        testSubtractingTwoIntegers(5, 3)
        testSubtractingTwoIntegers(324, 21)
        testSubtractingTwoIntegers(5233, 36432)
        testSubtractingTwoIntegers(5865, 343)
    }
    
    func testMultiplying() {
        testMultiplyingTwoIntegers(5, 3)
        testMultiplyingTwoIntegers(324, 21)
        testMultiplyingTwoIntegers(5233, 36432)
        testMultiplyingTwoIntegers(5865, 343)
    }
    
    func testDividing() {
        testDividingTwoIntegers(5, 3)
        testDividingTwoIntegers(324, 21)
        testDividingTwoIntegers(5233, 36432)
        testDividingTwoIntegers(5865, 343)
        testDividingTwoIntegers(789281, 10)
    }
    
    func testModing() {
        testModingTwoIntegers(5, 3)
        testModingTwoIntegers(324, 21)
        testModingTwoIntegers(5233, 36432)
        testModingTwoIntegers(5865, 343)
        testModingTwoIntegers(789281, 10)
    }
    
    func testPowering() {
        testPoweringTwoIntegers(5, 3)
        //testPoweringTwoIntegers(324, 21)
        //testPoweringTwoIntegers(5233, 36432)
        //testPoweringTwoIntegers(5865, 343)
    }
    
}
