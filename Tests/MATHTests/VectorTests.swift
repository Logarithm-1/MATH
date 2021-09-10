import XCTest
@testable import MATH

final class VectorTests: XCTestCase {
    
    func testDimensions() {
        XCTAssertEqual(Vector(vector: [1, 2, 3]).dimensions, 3)
        XCTAssertEqual(Vector(vector: [1, 2]).dimensions, 2)
        XCTAssertEqual(Vector(vector: [1, 2, 3, 4, 5]).dimensions, 5)
    }
    
    //MARK: - Not Too sure what to call this
    func testMagnitudeOther() {
        XCTAssertEqual(Vector(vector: [1, 2, 3]).magnitude(from: Vector(vector: [3, 2, 1])), 3)
    }
    
    func testMagnitudeOrgin() {
        XCTAssertEqual(Vector(vector: [1, 2, 3]).magnitude(), 3)
    }
    
    func testDirictionOther() {
        XCTAssertEqual(0, 1)
    }
    
    func testDirictionOrgin() {
        XCTAssertEqual(0, 1)
    }
    
    func testThetaOther() {
        XCTAssertEqual(0, 1)
    }
    
    func testThetaOrgin() {
        XCTAssertEqual(0, 1)
    }
    
    
    //MARK: - Compare
    func testEqualEqual() {
        XCTAssertEqual(0, 1)
    }
    
    func testLesserEqual() {
        XCTAssertEqual(0, 1)
    }
    
    func testLesser() {
        XCTAssertEqual(0, 1)
    }
    
    func testGreaterEqual() {
        XCTAssertEqual(0, 1)
    }
    
    func testGreater() {
        XCTAssertEqual(0, 1)
    }
    
    //MARK: - Arithmetic
    func testPlus() {
        XCTAssertEqual(0, 1)
    }
    
    func testPlusEqual() {
        XCTAssertEqual(0, 1)
    }
    
    func testMinus() {
        XCTAssertEqual(0, 1)
    }
    
    func testMinusEqual() {
        XCTAssertEqual(0, 1)
    }
    
    func testAsterisk() {
        XCTAssertEqual(0, 1)
    }
    
    func testAsteriskEqual() {
        XCTAssertEqual(0, 1)
    }
    
    func testBackslash() {
        XCTAssertEqual(0, 1)
    }
    
    func testBackslashEqual() {
        XCTAssertEqual(0, 1)
    }
    
    func testAsteriskAsterisk() {
        XCTAssertEqual(0, 1)
    }
    
    func testAsteriskAsteriskEqual() {
        XCTAssertEqual(0, 1)
    }
    
    func testPlusAsterisk() {
        XCTAssertEqual(0, 1)
    }
    
    func testPlusAsteriskEqual() {
        XCTAssertEqual(0, 1)
    }
    
    func testNegate() {
        XCTAssertEqual(0, 1)
    }
    
    //MARK: - Misc
    func testMatchDimensions() {
        XCTAssertEqual(0, 1)
    }
}
