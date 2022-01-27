// BasicTests.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/NumberTheory/blob/main/LICENSE for license information

import XCTest
@testable import ModularArithmetic

final class BasicTests: XCTestCase {
    
    func testMod(value: Int, base: Int, equal: Int) {
        XCTAssertEqual(value.modulus(base), equal)
    }
    
    func testInverse(value: Int, base: Int, equal: Int?) {
        XCTAssertEqual(value.inverse(for: base), equal)
    }
    
    func testDivision(dividend: Int, divisor: Int, modulo: Int, equal: Int) {
        XCTAssertEqual(dividend.divided(by: divisor, for: modulo), equal)
    }
    
    func testPower(value: Int, power: Int, base: Int, equal: Int) {
        XCTAssertEqual(value.power(of: power, for: base), equal)
    }
    
    func testInversePower(value: Int, power: Int, modulo: Int, equal: Int) {
        XCTAssertEqual(value.inversePower(of: power, for: modulo), equal)
    }
    
    func testMod() {
        testMod(value: 32, base: 26, equal: 6)
        testMod(value: -45, base: 26, equal: 7)
    }
    
    func testInverse() {
        testInverse(value: 3, base: 26, equal: 9)
        testInverse(value: 518, base: 26, equal: nil)
        testInverse(value: 842, base: 985, equal: 923)
    }
    
    func testDivision() {
        testDivision(dividend: 7, divisor: 5, modulo: 12, equal: 11)
        testDivision(dividend: 7, divisor: 11, modulo: 12, equal: 5)
        testDivision(dividend: 29, divisor: 7, modulo: 12, equal: 11)
    }
    
    func testPower() {
        testPower(value: 4, power: 8, base: 26, equal: 16)
        testPower(value: 5, power: 213, base: 26, equal: 5)
        testPower(value: 8, power: 848518, base: 26, equal: 12)
        testPower(value: 3, power: 848518, base: 26, equal: 3)
    }
    
    func testInversePower() {
        testInversePower(value: 5, power: 72, modulo: 13, equal: 1)
        testInversePower(value: 6, power: 95, modulo: 13, equal: 6)
        testInversePower(value: 9, power: 1264, modulo: 13, equal: 3)
    }
    
    
    
}
