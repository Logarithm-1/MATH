import XCTest
@testable import MATH

final class FloatingPointMathTests: XCTestCase {
    
    func testAbsoluteValue() {
        XCTAssertEqual(FloatingPointMath.absoluteValue(-5), 5)
    }
    
    func testFactorial() {
        XCTAssertEqual(FloatingPointMath.factorial(5), 120)
    }
    
    func testPower() {
        XCTAssertEqual(FloatingPointMath.power(5, 3), 125)
    }
    
    func testSquareRoot() {
        XCTAssertEqual(FloatingPointMath.squareRoot(16), 4)
        XCTAssertEqual(FloatingPointMath.squareRoot(17), 4.123105625617661)
        XCTAssertEqual(FloatingPointMath.squareRoot(18), 4.242640687119286)
        XCTAssertEqual(FloatingPointMath.squareRoot(19), 4.358898943540673)
        XCTAssertEqual(FloatingPointMath.squareRoot(20), 4.47213595499958)
        XCTAssertEqual(FloatingPointMath.squareRoot(21), 4.58257569495584)
        XCTAssertEqual(FloatingPointMath.squareRoot(22), 4.69041575982343)
        XCTAssertEqual(FloatingPointMath.squareRoot(23), 4.795831523312719)
        XCTAssertEqual(FloatingPointMath.squareRoot(24), 4.898979485566356)
        XCTAssertEqual(FloatingPointMath.squareRoot(25), 5)
    }
    
    func testLogarithm() {
        XCTAssertEqual(FloatingPointMath.logarithm(1000), 3)
        XCTAssertEqual(FloatingPointMath.logarithm(64, 2), 6)
    }
    
    func testNatralLogarithm() {
        XCTAssertEqual(FloatingPointMath.natralLogarithm(9), 2.1972245773)
    }
    
    func testDegreesToRadians() {
        XCTAssertEqual(FloatingPointMath.degreesToRadians(180), FloatingPointMath.pi)
    }
    
    func testRadiansToDegrees() {
        XCTAssertEqual(FloatingPointMath.radiansToDegrees(FloatingPointMath.pi), 180)
    }
    
    func testSine() {
        XCTAssertEqual(FloatingPointMath.sine(2), 0.909297426825641)
    }
    
    
}
