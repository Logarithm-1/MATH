import XCTest
@testable import MATH

final class BigIntTests: XCTestCase {
    
    func testInit() {
        XCTAssertEqual(BigInt(120).toString(), "120")
    }
    
    //MARK: - Compare
    
    func testEqulity() {
        let x = BigInt(120)
        let y = BigInt(120)
        let z = BigInt(340)
        
        XCTAssertEqual(x, y)
        XCTAssertTrue(x == y)
        XCTAssertFalse(x == z)
    }
    
    func testGreaterThanEqual() {
        let x = BigInt(120)
        let y = BigInt(340)
        
        XCTAssertTrue(x < y)
    }
    
    func testLesserThanEqual() {
        
    }
    
    func testGreaterThan() {
        
    }
    
    func testLesserThan() {
        
    }
    
    //MARK: - Arithmetic
    
    func testPlusEqualOperator() {
        
    }
    
    func testMinusEqualOperator() {
        
    }
    
    func testAsteriskEqualOperator() {
        
    }
    
    func testBackslashEqualOperator() {
        
    }
    
    func testPercentEqualOperator() {
        
    }
    
    func testAmpersandEqualOperator() {
        
    }
    
    func testVerticalEqualOperator() {
        
    }
    
    func testCaretEqualOperator() {
        
    }
    
    func testAmpersandGreaterEqualOperator() {
        
    }
    
    func testAmpersandLesserEqualOperator() {
        
    }
    
    func testAmpersandOperator() {
        
    }
    
    func testVerticalOperator() {
        
    }
    
    func testCaretOperator() {
        
    }
    
    func testAmpersandGreaterOperator() {
        
    }
    
    func testAmpersandLesserOperator() {
        
    }
    
    func testPlusOperator() {
        
    }
    
    func testMinusOperator() {
        
    }
    
    func testAsteriskOperator() {
        
    }
    
    func testBackslashOperator() {
        
    }
    
    func testPercentOperator() {
        
    }
    
    func testFactorial() {
        XCTAssertEqual(BigInt().factorial(n: 5), [1, 2, 0])
        XCTAssertEqual(BigInt().factorial(n: 8), [4, 0, 3, 2, 0])
        XCTAssertEqual(BigInt().factorial(n: 21), [5, 1, 0, 9, 0, 9, 4, 2, 1, 7, 1, 7, 0, 9, 4, 4, 0, 0, 0, 0])
    }
    
    func testAddition() {
        XCTAssertEqual(BigInt().addition([1, 2, 0], [2, 4, 8]), [3, 6, 8])
    }
}
