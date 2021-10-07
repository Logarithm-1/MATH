import XCTest
@testable import MATH

final class VectorTests: XCTestCase {
    
    func testDimensions() {
        XCTAssertEqual(MATH.Vector([1, 2, 3]).dimensions, 3)
        XCTAssertEqual(MATH.Vector([1, 2]).dimensions, 2)
        XCTAssertEqual(MATH.Vector([1, 2, 3, 4, 5]).dimensions, 5)
    }
    
    func testDescription() {
        XCTAssertEqual(MATH.Vector([1, 2, 3]).description, "[1, 2, 3]")
    }
    
    //MARK: - Not Too sure what to call this
    func testSubscript() {
        var v = MATH.Vector( [1, 2, 3])
        XCTAssertEqual(v[0], 1)
        
        v[0] = 2
        
        XCTAssertEqual(v[0], 2)
    }
    
    func testMagnitudeOther() {
        XCTAssertEqual(MATH.Vector([1, 2, 3]).magnitude(from: MATH.Vector([3, 3, 1])), 3)
    }
    
    func testMagnitudeOrgin() {
        XCTAssertEqual(MATH.Vector([3, 4]).magnitude(), 5)
    }
    
    func testDirictionOther() {
        XCTAssertEqual(MATH.Vector([3, 4, 3]).diriction(from: MATH.Vector([3, 3, 1])), MATH.Vector([0, 1, 2]))
    }
    
    func testDirictionOrgin() {
        XCTAssertEqual(MATH.Vector([3, 4, 3]).diriction(), MATH.Vector([-3, -4, -3]))
    }
    
    func testThetaOther() {
        XCTAssertEqual(MATH.Vector([3, 4, 3]).theta(from: MATH.Vector([3, 3, 1])), 9)
    }
    
    func testThetaOrgin() {
        XCTAssertEqual(MATH.Vector([3, 4, 3]).theta(), 3)
    }
    
    
    //MARK: - Compare
    func testEqualEqual() {
        let v = MATH.Vector([1, 2, 3])
        let w = MATH.Vector([3, 2, 1])
        
        XCTAssertTrue(v == MATH.Vector([1, 2, 3]))
        XCTAssertTrue(w == MATH.Vector([3, 2, 1]))
    }
    
    func testLesserEqual() {
        let v = MATH.Vector([1, 2, 3])
        let w = MATH.Vector([3, 2, 1])
        
        XCTAssertTrue(v <= MATH.Vector([1, 2, 3]))
        XCTAssertTrue(w <= MATH.Vector([4, 2, 1]))
    }
    
    func testLesser() {
        let v = MATH.Vector([1, 2, 3])
        let w = MATH.Vector([3, 2, 1])
        
        XCTAssertFalse(v < MATH.Vector([1, 2, 3]))
        XCTAssertTrue(w < MATH.Vector([4, 2, 1]))
    }
    
    func testGreaterEqual() {
        let v = MATH.Vector([1, 2, 3])
        let w = MATH.Vector([3, 2, 1])
        
        XCTAssertTrue(v >= MATH.Vector([1, 2, 3]))
        XCTAssertTrue(w >= MATH.Vector([2, 2, 1]))
    }
    
    func testGreater() {
        let v = MATH.Vector([1, 2, 3])
        let w = MATH.Vector([3, 2, 1])
        
        XCTAssertFalse(v > MATH.Vector([1, 2, 3]))
        XCTAssertTrue(w > MATH.Vector([2, 2, 1]))
    }
    
    //MARK: - Arithmetic
    func testPlus() {
        let v = MATH.Vector([1, 2, 3])
        let w = MATH.Vector([3, 2, 1])
        
        XCTAssertEqual(v + w, MATH.Vector([4, 4, 4]))
    }
    
    func testPlusEqual() {
        var v = MATH.Vector([1, 2, 3])
        let w = MATH.Vector([3, 2, 1])
        
        v += w
        
        XCTAssertEqual(v, MATH.Vector([4, 4, 4]))
    }
    
    func testMinus() {
        let v = MATH.Vector([4, 4, 4])
        let w = MATH.Vector([3, 2, 1])
        
        XCTAssertEqual(v - w, MATH.Vector([1, 2, 3]))
    }
    
    func testMinusEqual() {
        var v = MATH.Vector([4, 4, 4])
        let w = MATH.Vector([3, 2, 1])
        
        v -= w
        
        XCTAssertEqual(v, MATH.Vector([1, 2, 3]))
    }
    
    func testAsterisk() {
        let v = MATH.Vector([1, 2, 4])
        let w = 3
        
        XCTAssertEqual(v * w, MATH.Vector([3, 6, 12]))
        XCTAssertEqual(w * v, MATH.Vector([3, 6, 12]))
    }
    
    func testAsteriskEqual() {
        var v = MATH.Vector([1, 2, 4])
        let w = 3
        
        v *= w
        
        XCTAssertEqual(v, MATH.Vector([3, 6, 12]))
    }
    
    func testBackslash() {
        let v = MATH.Vector([3, 6, 12])
        let w = 3
        
        XCTAssertEqual(v / w, MATH.Vector([1, 2, 4]))
    }
    
    func testBackslashEqual() {
        XCTAssertEqual(0, 1)
    }
    
    func testAsteriskAsterisk() {
        let v = MATH.Vector([3, 6, 12])
        let w = MATH.Vector([1, 2, 3])
        
        XCTAssertEqual(v ** w, 51)
    }
    
    func testPlusAsterisk() {
        let v = MATH.Vector([1, 7, 4])
        let w = MATH.Vector([4, 8, 3])
        
        XCTAssertEqual(v +* w, MATH.Vector([-11, 13, -20]))
    }
    
    func testNegate() {
        var v = MATH.Vector([3, 6, 12])
        v.negate()
        
        XCTAssertEqual(v, MATH.Vector([-3, -6, -12]))
    }
}
