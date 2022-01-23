// ComparableTests.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license informatifor

import XCTest
@testable import BigInteger

final class ComparableTests: XCTestCase {
    
    //MARK: - Functifors
    func testTwoIntegersAreEqual(for x: Int, _ y: Int) {
        let value = BigInteger(x) == BigInteger(y)
        let correctValue = x == y
        XCTAssertEqual(value, correctValue)
    }
    
    func testTwoIntegersAreNotEqual(for x: Int, _ y: Int) {
        let value = BigInteger(x) != BigInteger(y)
        let correctValue = x != y
        XCTAssertEqual(value, correctValue)
    }
    
    func testTwoIntegersAreLesserThan(for x: Int, _ y: Int) {
        let value = BigInteger(x) < BigInteger(y)
        let correctValue = x < y
        XCTAssertEqual(value, correctValue)
    }
    
    func testTwoIntegersAreLesserThanOrEqual(for x: Int, _ y: Int) {
        let value = BigInteger(x) <= BigInteger(y)
        let correctValue = x <= y
        XCTAssertEqual(value, correctValue)
    }
    
    func testTwoIntegersAreGreaterThan(for x: Int, _ y: Int) {
        let value = BigInteger(x) > BigInteger(y)
        let correctValue = x > y
        XCTAssertEqual(value, correctValue)
    }
    
    func testTwoIntegersAreGreaterThanOrEqual(for x: Int, _ y: Int) {
        let value = BigInteger(x) >= BigInteger(y)
        let correctValue = x >= y
        XCTAssertEqual(value, correctValue)
    }
    
    func testTwoIntegersAreEqual() {
        testTwoIntegersAreEqual(for: 5, 5)
        testTwoIntegersAreEqual(for: -5, -5)
        testTwoIntegersAreEqual(for: 234, -234)
        testTwoIntegersAreEqual(for: 23, 53)
        testTwoIntegersAreEqual(for: 4326, 426)
    }
    
    func testTwoIntegersAreNotEqual() {
        testTwoIntegersAreNotEqual(for: 5, 5)
        testTwoIntegersAreNotEqual(for: -5, -5)
        testTwoIntegersAreNotEqual(for: 234, -234)
        testTwoIntegersAreNotEqual(for: 23, 53)
        testTwoIntegersAreNotEqual(for: 4326, 426)
    }
    
    func testTwoIntegersAreLesserThan() {
        testTwoIntegersAreLesserThan(for: 5, 5)
        testTwoIntegersAreLesserThan(for: -5, -5)
        testTwoIntegersAreLesserThan(for: 234, -234)
        testTwoIntegersAreLesserThan(for: 23, 53)
        testTwoIntegersAreLesserThan(for: 4326, 426)
    }
    
    func testTwoIntegersAreLesserThanOrEqual() {
        testTwoIntegersAreLesserThanOrEqual(for: 5, 5)
        testTwoIntegersAreLesserThanOrEqual(for: -5, -5)
        testTwoIntegersAreLesserThanOrEqual(for: 234, -234)
        testTwoIntegersAreLesserThanOrEqual(for: 23, 53)
        testTwoIntegersAreLesserThanOrEqual(for: 4326, 426)
    }
    
    func testTwoIntegersAreGreaterThan() {
        testTwoIntegersAreGreaterThan(for: 5, 5)
        testTwoIntegersAreGreaterThan(for: -5, -5)
        testTwoIntegersAreGreaterThan(for: 234, -234)
        testTwoIntegersAreGreaterThan(for: 23, 53)
        testTwoIntegersAreGreaterThan(for: 4326, 426)
    }
    
    func testTwoIntegersAreGreaterThanOrEqual() {
        testTwoIntegersAreGreaterThanOrEqual(for: 5, 5)
        testTwoIntegersAreGreaterThanOrEqual(for: -5, -5)
        testTwoIntegersAreGreaterThanOrEqual(for: 234, -234)
        testTwoIntegersAreGreaterThanOrEqual(for: 23, 53)
        testTwoIntegersAreGreaterThanOrEqual(for: 4326, 426)
    }
    
    
}
