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
    
    func testStringInitializer(for str: String) {
        XCTAssertEqual((BigInteger(str) ?? BigInteger(5)).toString(), str)
        XCTAssertEqual(String(BigUInteger(str) ?? BigUInteger(5)), str)
    }
    
    func testToString(for value: Int) {
        XCTAssertEqual(BigInteger(value).toString(radix: 2),  String(value, radix: 2))
        XCTAssertEqual(BigInteger(value).toString(radix: 8),  String(value, radix: 8))
        XCTAssertEqual(BigInteger(value).toString(radix: 10), String(value, radix: 10))
        XCTAssertEqual(BigInteger(value).toString(radix: 16), String(value, radix: 16))
        XCTAssertEqual(BigInteger(value).toString(radix: 32), String(value, radix: 32))
        XCTAssertEqual(BigInteger(value).toString(radix: 36), String(value, radix: 36))
        
        XCTAssertEqual(String(BigUInteger(value), radix: 2),  String(value, radix: 2))
        XCTAssertEqual(String(BigUInteger(value), radix: 8),  String(value, radix: 8))
        XCTAssertEqual(String(BigUInteger(value), radix: 10), String(value, radix: 10))
        XCTAssertEqual(String(BigUInteger(value), radix: 16), String(value, radix: 16))
        XCTAssertEqual(String(BigUInteger(value), radix: 32), String(value, radix: 32))
        XCTAssertEqual(String(BigUInteger(value), radix: 36), String(value, radix: 36))
    }
    
    func testStringInitializer() {
        testStringInitializer(for: "5845")
        testStringInitializer(for: "89465168465165432184")
        testStringInitializer(for: "46849685498168465486516842684849848945467468948")
        testStringInitializer(for: "849841659848798459135215646548978915239729821849546124561984687643218239856256495662632326598956326895622213465498745165852585258516897465843216465465432")
    }
    
    func testToString() {
        testToString(for: 1023)
        testToString(for: 8148246)
        testToString(for: 789281)
        testToString(for: 5658)
    }
    
    func measureStringInitializer() {
        measure {
            testStringInitializer(for: "46849685498168465486516842684849848945467468948")
        }
    }
    
    func testWords() {
        let num: BigUInteger = 123
        print(num.words[0])
    }
}
