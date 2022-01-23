// ArithmeticTests.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

import XCTest
@testable import Vector

final class ArithmeticTests: XCTestCase {
    func testAddingTwoVectors(_ x: [Double], _ y: [Double], equal: [Double]) {
        let left = Vector(x)
        let right = Vector(y)
        let equal = Vector(equal)
        
        XCTAssertEqual(left + right, equal)
    }
    
    func testSubtractingTwoVectors(_ x: [Double], _ y: [Double], equal: [Double]) {
        let left = Vector(x)
        let right = Vector(y)
        let equal = Vector(equal)
        
        XCTAssertEqual(left - right, equal)
    }
    
    func testAddingTwoVectors() {
        testAddingTwoVectors([1, 2, 3], [3, 2, 1], equal: [4, 4, 4])
    }
    
    func testSubtractingTwoVectors() {
        testSubtractingTwoVectors([1, 2, 3], [3, 2, 1], equal: [-2, 0, 2])
    }
    
}
