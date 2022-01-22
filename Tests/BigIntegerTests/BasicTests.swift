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
    
    func testMaxArraySize() {
        var arr: [Bool] = [Bool]()
        
        for i in 0..<10000 {
            arr.append(true)
        }
        
        print(arr.count)
        XCTAssertTrue(true)
    }
    
}
