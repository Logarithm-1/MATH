import XCTest
@testable import MATH

final class MODTests: XCTestCase {
    
    func testMODGenerics() {
        let a: MOD = MOD<Int>(base: 2)
    }
    
    func testMOD() {
        let a: MOD = MOD<Int>(base: 2)
        
        XCTAssertTrue(a.mod(8) == 0)
        XCTAssertTrue(a.mod(7) == 1)
        XCTAssertTrue(a.mod(-1) == 1)
    }
    
    
    
    func testGreatestCommonDenominator() {
        let a: MOD = MOD<Int>(base: 2)
        
        XCTAssertTrue(a.greatestCommonDenominator(5, 9) == 1)
        XCTAssertTrue(a.greatestCommonDenominator(25, 45) == 5)
    }
    
    func testGreatestCommonDenominatorExtended() {
        let a: MOD = MOD<Int>(base: 2)
        var x: Int = 0
        var y: Int = 0
        let gcd = a.greatestCommonDenominatorExtended(123, 56, firstCoefficient: &x, secondCoefficient: &y)
        
        print(gcd, x, y)
        
        
        XCTAssertTrue(a.greatestCommonDenominator(5, 9) == 1)
        XCTAssertTrue(a.greatestCommonDenominator(25, 45) == 5)
    }
    
    
    
    
}
