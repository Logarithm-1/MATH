// AdditiveArithmeticTests.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

import XCTest
@testable import BigInteger

final class AdditiveArithmeticTests: XCTestCase {
    
    func testAddingTwoIntegers(_ x: Int, _ y: Int) {
        let bigInt: BigInteger = BigInteger(x) + BigInteger(y)
        XCTAssertEqual(bigInt.toInt(), x + y)
    }
    
    func testInitializers() {
        testAddingTwoIntegers(5, 3)
        
    }
    
}
