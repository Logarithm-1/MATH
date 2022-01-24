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
        XCTAssertEqual(num.toString(), "11001")
    }
    
    func testToString() {
        XCTAssertEqual(BigInteger(1023).toString(radix: 10), "1023")
    }
    
}
