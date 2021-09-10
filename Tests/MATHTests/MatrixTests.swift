import XCTest
@testable import MATH

final class MatrixTests: XCTestCase {
    
    func testRows() {
        let m = Matrix(matrix: [[1, 2, 3], [3, 2, 1]])
        XCTAssertEqual(m.rows, 2)
    }
    
    func testCols() {
        let m = Matrix(matrix: [[1, 2, 3], [3, 2, 1]])
        XCTAssertEqual(m.cols, 3)
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
    
    func testNegate() {
        XCTAssertEqual(0, 1)
    }
    
}
