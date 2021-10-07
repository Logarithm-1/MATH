import XCTest
@testable import MATH

final class MODTests: XCTestCase {
    
    func testMODGenerics() {
        let a: MATH.MOD = MATH.MOD<Int>(modulus: 2)
    }
    
    func testMOD() {
        let a: MATH.MOD = MATH.MOD<Int>(modulus: 2)
        
        XCTAssertTrue(a.mod(8) == 0)
        XCTAssertTrue(a.mod(7) == 1)
        XCTAssertTrue(a.mod(-1) == 1)
    }
    
    func testDivision() {
        let base12: MATH.MOD = MATH.MOD<Int>(modulus: 12)
        XCTAssertEqual(base12.divide(7, 5), 11)
        XCTAssertEqual(base12.divide(7, 11), 5)
        XCTAssertEqual(base12.divide(29, 7), 11)
    }
    
    func testPower() {
        let base12: MATH.MOD = MATH.MOD<Int>(modulus: 12)
        XCTAssertEqual(base12.power(5, 213), 5)
        XCTAssertEqual(base12.power(8, 848518), 4)
        XCTAssertEqual(base12.power(3, 848518), 9)
    }
    
    func testInvserPower() {
        let base13: MATH.MOD = MATH.MOD<Int>(modulus: 13)
        XCTAssertEqual(base13.inversePower(5, 72), 5)
        XCTAssertEqual(base13.inversePower(6, 95), 6)
        XCTAssertEqual(base13.inversePower(9, 1264), 3)
    }

}
