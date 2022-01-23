// BasicTests.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

import XCTest
@testable import ModularArithmetic

final class BasicTests: XCTestCase {
    
    func testInitializers() {
        var num: Int = 32
        
        XCTAssertEqual(num.mod(26), 6)
        XCTAssertEqual(num.divided(by: 2, base: 26), 16)
    }
    
}
