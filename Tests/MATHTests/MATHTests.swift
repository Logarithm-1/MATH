import XCTest
@testable import MATH

final class MATHTests: XCTestCase {
    func testGreatestCommonDenominator() {
        XCTAssertTrue(MATH.greatestCommonDenominator(5, 9) == 1)
        XCTAssertTrue(MATH.greatestCommonDenominator(25, 45) == 5)
    }
    
    func testGreatestCommonDenominatorExtended() {
        var x: Int = 0
        var y: Int = 0
        var gcd = MATH.greatestCommonDenominatorExtended(123, 56, firstCoefficient: &x, secondCoefficient: &y)
        
        XCTAssertEqual(x, -5)
        XCTAssertEqual(y, 11)
        XCTAssertEqual(gcd, 1)
        
        gcd = MATH.greatestCommonDenominatorExtended(12, 7, firstCoefficient: &x, secondCoefficient: &y)
        
        XCTAssertEqual(x, 3)
        XCTAssertEqual(y, -5)
        XCTAssertEqual(gcd, 1)
        
        gcd = MATH.greatestCommonDenominatorExtended(12, 5, firstCoefficient: &x, secondCoefficient: &y)
        
        XCTAssertEqual(x, -2)
        XCTAssertEqual(y, 5)
        XCTAssertEqual(gcd, 1)
    }
    
    func testIsPrime() {
        XCTAssertTrue(MATH.isPrime(13))
    }
    
    func testAbsoluteValue() {
        
    }
    
    func testFactorial() {
        
    }
    
    func testPower() {
        //XCTAssertEqual(MATH.power(5, 3), 125)
    }
    
    func testSquareRoot() {
        /*XCTAssertEqual(MATH.squareRoot(16), 4)
        XCTAssertEqual(MATH.squareRoot(17), 4.123105625617661)
        XCTAssertEqual(MATH.squareRoot(18), 4.242640687119286)
        XCTAssertEqual(MATH.squareRoot(19), 4.358898943540673)
        XCTAssertEqual(MATH.squareRoot(20), 4.47213595499958)
        XCTAssertEqual(MATH.squareRoot(21), 4.58257569495584)
        XCTAssertEqual(MATH.squareRoot(22), 4.69041575982343)
        XCTAssertEqual(MATH.squareRoot(23), 4.795831523312719)
        XCTAssertEqual(MATH.squareRoot(24), 4.898979485566356)
        XCTAssertEqual(MATH.squareRoot(25), 5)*/
    }
    
    func testLogarithm() {
        //XCTAssertEqual(MATH.logarithm(1000), 3)
        //XCTAssertEqual(MATH.logarithm(64, 2), 6)
    }
    
    func testNatralLogarithm() {
        //XCTAssertEqual(MATH.natralLogarithm(9), 2.1972245773)
    }
    
    func testDegreesToRadians() {
        //XCTAssertEqual(MATH.degreesToRadians(180), MATH.pi)
    }
    
    func testRadiansToDegrees() {
       //XCTAssertEqual(MATH.radiansToDegrees(MATH.pi), 180)
    }
    
    func testSine() {
        //XCTAssertEqual(MATH.sine(2), 0.909297426825641)
    }
    
}
