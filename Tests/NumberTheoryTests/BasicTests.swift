// BasicTests.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

import XCTest
@testable import IntegerUtilities

final class BasicTests: XCTestCase {
    
    func testGCD(for x: Int, _ y: Int, equals: Int, x_co: Int, y_co: Int) {
        let gcd = greatestCommonDenominator(x, y)
        XCTAssertEqual(gcd, equals)
        
        let gcd_ext = greatestCommonDenominatorExtended(x, y)
        XCTAssertEqual(gcd_ext.gcd, equals)
        XCTAssertEqual(gcd_ext.aCoefficient, x_co)
        XCTAssertEqual(gcd_ext.bCoefficient, y_co)
    }
    
    func testGCD() {
        testGCD(for: 150, 180, equals: 30, x_co: -1, y_co: 1)
        testGCD(for: 57, 81, equals: 3, x_co: 10, y_co: -7)
        testGCD(for: 3, 180, equals: 3, x_co: 1, y_co: 0)
    }
    
}
