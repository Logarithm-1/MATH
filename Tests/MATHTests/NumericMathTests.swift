import XCTest
@testable import MATH

final class NumericMathTests: XCTestCase {
    
    func testAbs() {
        XCTAssertEqual(NumericMath.abs(-8492), 8492)
    }
    
    func testSquareRoot() {
        XCTAssertEqual(NumericMath.squareRoot(16), 4)
    }
    
}
