import XCTest
@testable import MATH

//` 1 2 3 4 5 6 7 8 9 0 - = q w e r t y u i o p [ ] \ a s d f g h j k l ; ' z x c v b n m , . /
//` ¡ ™ £ ¢ ∞ § ¶ • ª º – ≠ œ ∑ ´ ® † ¥ ¨ ˆ ø π “ ‘ « å ß ∂ ƒ © ˙ ∆ ˚ ¬ … æ Ω ≈ ç √ ∫ ˜ µ ≤ ≥ ÷
//` ⁄ € ‹ › ﬁ ﬂ ‡ ° · ‚ — ± Œ „ ´ ‰ ˇ Á ¨ ˆ Ø ∏ ” ’ » Å Í Î Ï ˝ Ó Ô  Ò Ú Æ ¸ ˛ Ç ◊ ı ˜ Â ¯ ˘ ¿


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
    
    func testSummation() {
        let inside: (Int) -> Int = { i in
            2*i*i + 5*i + 3
        }
        let sum: Int = MATH.summation(start: 0, end: 10, completion: inside)
        XCTAssertEqual(sum, 1078)
        
        let sum2: Double = MATH.summation(start: 0, end: 10) { i in
            23.78*Double(i*i) + Double(7*i) + 9.0
        }
        
        XCTAssertEqual(sum2, 9639.3)
    }
    
    func testProduct() {
        let inside: (Int) -> Int = { i in
            2*i + 3
        }
        let sum: Int = MATH.product(start: 0, end: 5, completion: inside)
        XCTAssertEqual(sum, 135135)
        
        let sum2: Double = MATH.product(start: 0, end: 5) { i in
            23.78*Double(i*i) + Double(7*i) + 9.0
        }
        
        XCTAssertEqual(sum2, 2750760159949.558)
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
        XCTAssertEqual(MATH.squareRoot(16), 4)
        XCTAssertEqual(MATH.squareRoot(17), 4.123105625617661)
        XCTAssertEqual(MATH.squareRoot(18), 4.242640687119286)
        XCTAssertEqual(MATH.squareRoot(19), 4.358898943540673)
        XCTAssertEqual(MATH.squareRoot(20), 4.47213595499958)
        XCTAssertEqual(MATH.squareRoot(21), 4.58257569495584)
        XCTAssertEqual(MATH.squareRoot(22), 4.69041575982343)
        XCTAssertEqual(MATH.squareRoot(23), 4.795831523312719)
        XCTAssertEqual(MATH.squareRoot(24), 4.898979485566356)
        XCTAssertEqual(MATH.squareRoot(25), 5)
    }
    
    func testLogarithm() {
        //XCTAssertEqual(MATH.logarithm(1000), 3)
        //XCTAssertEqual(MATH.logarithm(64, 2), 6)
    }
    
    func testNatralLogarithm() {
        //XCTAssertEqual(MATH.natralLogarithm(9), 2.1972245773)
    }
    
    func testDegreesToRadians() {
        XCTAssertEqual(MATH.degreesToRadians(180), MATH.Constants.π)
    }
    
    func testRadiansToDegrees() {
        XCTAssertEqual(MATH.radiansToDegrees(MATH.Constants.π), 180)
    }
    
    func testSine() {
        XCTAssertEqual(MATH.sine(2), 0.909297426825641)
    }
    
}
