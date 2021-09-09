import XCTest
@testable import MATH

final class IntegerMathTests: XCTestCase {
    
    func testGreatestCommonDenominator() {
        XCTAssertTrue(IntegerMath.greatestCommonDenominator(5, 9) == 1)
        XCTAssertTrue(IntegerMath.greatestCommonDenominator(25, 45) == 5)
    }
    
    func testGreatestCommonDenominatorExtended() {
        var x: Int = 0
        var y: Int = 0
        var gcd = IntegerMath.greatestCommonDenominatorExtended(123, 56, firstCoefficient: &x, secondCoefficient: &y)
        
        XCTAssertEqual(x, -5)
        XCTAssertEqual(y, 11)
        XCTAssertEqual(gcd, 1)
        
        gcd = IntegerMath.greatestCommonDenominatorExtended(12, 7, firstCoefficient: &x, secondCoefficient: &y)
        
        XCTAssertEqual(x, 3)
        XCTAssertEqual(y, -5)
        XCTAssertEqual(gcd, 1)
        
        gcd = IntegerMath.greatestCommonDenominatorExtended(12, 5, firstCoefficient: &x, secondCoefficient: &y)
        
        XCTAssertEqual(x, -2)
        XCTAssertEqual(y, 5)
        XCTAssertEqual(gcd, 1)
    }
    
    func testIsPrime() {
        XCTAssertTrue(IntegerMath.isPrime(13))
    }
    
}
