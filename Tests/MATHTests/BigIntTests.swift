import XCTest
@testable import MATH

final class BigIntTests: XCTestCase {
    
    func testInit() {
        let x: BigInt = 120
        XCTAssertEqual(x.toString(), "120")
        XCTAssertEqual(BigInt(120).toString(), "120")
        XCTAssertEqual(BigInt([0, 2, 1]).toString(), "120")
        XCTAssertEqual(BigInt([12870]).source, [0, 7, 8, 2, 1])
        XCTAssertEqual(BigInt([12870, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]).source, [0, 7, 8, 2, 1])
    }
    
    //MARK: - Compare
    
    func testEqulity() {
        let x = BigInt(120)
        let y = BigInt(120)
        let z = BigInt(340)
        
        let a = BigInt(-120)
        
        XCTAssertEqual(x, y)
        XCTAssertTrue(x == y)
        XCTAssertFalse(x == z)
        XCTAssertTrue(x != z)
        
        XCTAssertTrue(-x == a)
        XCTAssertFalse(x == a)
    }
    
    func testGreaterThanEqual() {
        let x = BigInt(120)
        let y = BigInt(120)
        let z = BigInt(340)
        
        let a = BigInt(-340)
        
        XCTAssertTrue(x >= y)
        XCTAssertTrue(z >= x)
        XCTAssertFalse(x >= z)
        
        XCTAssertTrue(x >= a)
        XCTAssertFalse(a >= z)
    }
    
    func testLesserThanEqual() {
        let x = BigInt(120)
        let y = BigInt(120)
        let z = BigInt(340)
        
        XCTAssertTrue(x <= y)
        XCTAssertTrue(x <= z)
        XCTAssertFalse(z <= x)
    }
    
    func testGreaterThan() {
        let x = BigInt(452)
        let y = BigInt(452)
        let z = BigInt(348)
        
        XCTAssertFalse(x > y)
        XCTAssertTrue(x > z)
        XCTAssertFalse(z > x)
    }
    
    func testLesserThan() {
        let x = BigInt(120)
        let y = BigInt(120)
        let z = BigInt(340)
        
        XCTAssertFalse(x < y)
        XCTAssertTrue(x < z)
        XCTAssertFalse(z < x)
    }
    
    //MARK: - Arithmetic
    
    func testPlusEqualOperator() {
        var x = BigInt(123)
        let y = BigInt(590)
        let z = BigInt(713)
        
        x += y
        
        XCTAssertEqual(x, z)
    }
    
    func testMinusEqualOperator() {
        var x = BigInt(123)
        let y = BigInt(590)
        let z = BigInt(-467)
        
        x -= y
        
        XCTAssertEqual(x, z)
    }
    
    func testAsteriskEqualOperator() {
        var x = BigInt(123)
        let y = BigInt(2)
        let z = BigInt(246)
        
        x *= y
        XCTAssertEqual(x, z)
        
        x *= z
        XCTAssertEqual(x, BigInt(60516))
    }
    
    func testBackslashEqualOperator() {
        var x = BigInt(123)
        let y = BigInt(2)
        let z = BigInt(61)
        
        x /= y
        
        XCTAssertEqual(x, z)
    }
    
    func testPercentEqualOperator() {
        var x = BigInt(123)
        let y = BigInt(35)
        let z = BigInt(18)
        
        x %= y
        
        XCTAssertEqual(x, z)
    }
    
    func testAmpersandEqualOperator() {
        var x = BigInt(123)
        let y = BigInt(35)
        let z = BigInt(18)
        
        x &= y
        
        XCTAssertEqual(x, z)
    }
    
    func testVerticalEqualOperator() {
        var x = BigInt(123)
        let y = BigInt(35)
        let z = BigInt(18)
        
        x |= y
        
        XCTAssertEqual(x, z)
    }
    
    func testCaretEqualOperator() {
        var x = BigInt(123)
        let y = BigInt(35)
        let z = BigInt(18)
        
        x ^= y
        
        XCTAssertEqual(x, z)
    }
    
    func testAmpersandGreaterEqualOperator() {
        var x = BigInt(123)
        let y = BigInt(35)
        let z = BigInt(18)
        
        x &>>= y
        
        XCTAssertEqual(x, z)
    }
    
    func testAmpersandLesserEqualOperator() {
        var x = BigInt(123)
        let y = BigInt(35)
        let z = BigInt(18)
        
        x &<<= y
        
        XCTAssertEqual(x, z)
    }
    
    func testAmpersandOperator() {
        let x = BigInt(123)
        let y = BigInt(590)
        let z = BigInt(713)
        
        XCTAssertEqual(x & y, z)
    }
    
    func testVerticalOperator() {
        let x = BigInt(123)
        let y = BigInt(590)
        let z = BigInt(713)
        
        XCTAssertEqual(x | y, z)
    }
    
    func testCaretOperator() {
        let x = BigInt(123)
        let y = BigInt(590)
        let z = BigInt(713)
        
        XCTAssertEqual(x ^ y, z)
    }
    
    func testAmpersandGreaterOperator() {
        let x = BigInt(123)
        let y = BigInt(590)
        let z = BigInt(713)
        
        XCTAssertEqual(x &>> y, z)
    }
    
    func testAmpersandLesserOperator() {
        let x = BigInt(123)
        let y = BigInt(590)
        let z = BigInt(713)
        
        XCTAssertEqual(x &<< y, z)
    }
    
    func testPlusOperator() {
        let x = BigInt(123)
        let y = BigInt(590)
        let z = BigInt(713)
        
        let a = BigInt(-123)
        let b = BigInt(-590)
        let c = BigInt(467)
        let d = BigInt(-713)
        
        XCTAssertEqual(x + y, z)
        XCTAssertEqual(a + y, c)
        XCTAssertEqual(a + b, d)
    }
    
    func testMinusOperator() {
        let x = BigInt(123)
        let y = BigInt(590)
        let z = BigInt(-467)
        
        XCTAssertEqual(x - y, z)
    }
    
    func testAsteriskOperator() {
        let x = BigInt(123)
        let y = BigInt(2)
        let z = BigInt(246)
        
        let a = BigInt(-2)
        let b = BigInt(-246)
        
        XCTAssertEqual(x * y, z)
        XCTAssertEqual(x * a, b)
    }
    
    func testBackslashOperator() {
        let x = BigInt(123)
        let y = BigInt(2)
        let z = BigInt(61)
        
        let a = BigInt(123543)
        let b = BigInt(123)
        let c = BigInt(1004)
        
        let d = BigInt(123)
        let e = BigInt(-2)
        let f = BigInt(-61)
        
        XCTAssertEqual(x / y, z)
        XCTAssertEqual(a / b, c)
        XCTAssertEqual(d / e, f)
    }
    
    func testPercentOperator() {
        let x = BigInt(123)
        let y = BigInt(35)
        let z = BigInt(18)
        
        let a = BigInt(123543)
        let b = BigInt(123)
        let c = BigInt(51)
        
        XCTAssertEqual(x % y, z)
        XCTAssertEqual(a % b, c)
    }
    
    func testPrefixDash() {
        let x = BigInt(+123)
        let y = BigInt(-123)
        
        XCTAssertEqual(-x, y)
        XCTAssertEqual(-y, x)
    }
    
    func testPrefixPlus() {
        let x = BigInt(+123)
        let y = BigInt(-123)
        
        XCTAssertEqual(-x, y)
        XCTAssertEqual(-y, x)
    }
    
    func testPrefixScrible() {
        let x = BigInt(123)
        let y = BigInt(~123)
        
        XCTAssertEqual(~x, y)
    }
    
    //MARK: - Range
    
    func testDotDotDot() {
        var t = BigInt()
        
        for i in BigInt(0)...BigInt(21) {
            t += i
        }
        
        let r = BigInt(231)
        
        XCTAssertEqual(t, r)
    }
    
    func testPrefixDotDotDot() {
        XCTAssertTrue(false)
    }
    
    func testPostfixDotDotDot() {
        XCTAssertTrue(false)
    }
    
    func testDotDotLesser() {
        var t = BigInt()
        
        for i in BigInt(0)..<BigInt(21) {
            t += i
        }
        
        let r = BigInt(210)
        
        XCTAssertEqual(t, r)
    }
    
    func testPrefixDotDotLesser() {
        XCTAssertTrue(false)
    }
    
    
    //MARK: - Other
    func testDistance() {
        let x = BigInt(123)
        let y = BigInt(35)
        let z = BigInt(88)
        
        let distance = x.distance(to: y)
        //XCTAssertEqual(distance, z)
    }
    
    func testAdvanced() {
        let x = BigInt(35)
        let y = BigInt(88)
        let z = BigInt(123)
        
        //let advanced = x.advanced(by: y)
        //XCTAssertEqual(advanced, z)
    }
    
    func testFactorial() {
        XCTAssertEqual(BigInt(5).factorial(), BigInt(120))
        XCTAssertEqual(BigInt(8).factorial(), BigInt(40320))
        XCTAssertEqual(BigInt(21).factorial(), BigInt(reversed: [5, 1, 0, 9, 0, 9, 4, 2, 1, 7, 1, 7, 0, 9, 4, 4, 0, 0, 0, 0]))
    }
    
    func testReArangeArray() {
        XCTAssertEqual(BigInt([1, 23, 4]).toString(), "631")
        XCTAssertEqual(BigInt([1, 2, 3, 0, 0]).toString(), "321")
        XCTAssertEqual(BigInt([-1, 2, 3]).toString(), "319")
        XCTAssertEqual(BigInt([1, 2, -3, 4]).toString(), "3,721")
        XCTAssertEqual(BigInt([1, 2, -3]).toString(), "-279")
        XCTAssertEqual(BigInt([-1, -2, -3]).toString(), "-321")
    }
}
