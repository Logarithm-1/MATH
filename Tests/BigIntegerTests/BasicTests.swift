// BasicTests.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

import XCTest
@testable import BigInteger

final class BasicTests: XCTestCase {
    
    func testInitializers() {
        let num: BigInteger = BigInteger(25)
        XCTAssertEqual(num.toString(), "25")
    }
    
    func testToString(for value: Int) {
        XCTAssertEqual(BigInteger(value).toString(radix: 2),  String(value, radix: 2))
        XCTAssertEqual(BigInteger(value).toString(radix: 8),  String(value, radix: 8))
        XCTAssertEqual(BigInteger(value).toString(radix: 10), String(value, radix: 10))
        XCTAssertEqual(BigInteger(value).toString(radix: 16), String(value, radix: 16))
        XCTAssertEqual(BigInteger(value).toString(radix: 32), String(value, radix: 32))
        XCTAssertEqual(BigInteger(value).toString(radix: 36), String(value, radix: 36))
    }
    
    func testToString() {
        testToString(for: 1023)
        testToString(for: 8148246)
        testToString(for: 789281)
        testToString(for: 5658)
    }
    
}
