import XCTest
@testable import MATH

final class VectorTests: XCTestCase {
    
    func testDimensions() {
        XCTAssertEqual(Vector([1, 2, 3]).dimensions, 3)
        XCTAssertEqual(Vector([1, 2]).dimensions, 2)
        XCTAssertEqual(Vector([1, 2, 3, 4, 5]).dimensions, 5)
    }
    
    func testDescription() {
        XCTAssertEqual(Vector([1, 2, 3]).description, "[1, 2, 3]")
    }
    
    //MARK: - Not Too sure what to call this
    func testSubscript() {
        var v = Vector( [1, 2, 3])
        XCTAssertEqual(v[0], 1)
        
        v[0] = 2
        
        XCTAssertEqual(v[0], 2)
    }
    
    func testMagnitudeOther() {
        XCTAssertEqual(Vector([1, 2, 3]).magnitude(from: Vector([3, 3, 1])), 3)
    }
    
    func testMagnitudeOrgin() {
        XCTAssertEqual(Vector([3, 4]).magnitude(), 5)
    }
    
    func testDirictionOther() {
        XCTAssertEqual(Vector([3, 4, 3]).diriction(from: Vector([3, 3, 1])), Vector([0, 1, 2]))
    }
    
    func testDirictionOrgin() {
        XCTAssertEqual(Vector([3, 4, 3]).diriction(), Vector([-3, -4, -3]))
    }
    
    func testThetaOther() {
        XCTAssertEqual(Vector([3, 4, 3]).theta(from: Vector([3, 3, 1])), 9)
    }
    
    func testThetaOrgin() {
        XCTAssertEqual(Vector([3, 4, 3]).theta(), 3)
    }
    
    
    //MARK: - Compare
    func testEqualEqual() {
        let v = Vector([1, 2, 3])
        let w = Vector([3, 2, 1])
        
        XCTAssertTrue(v == Vector([1, 2, 3]))
        XCTAssertTrue(w == Vector([3, 2, 1]))
    }
    
    func testLesserEqual() {
        let v = Vector([1, 2, 3])
        let w = Vector([3, 2, 1])
        
        XCTAssertTrue(v <= Vector([1, 2, 3]))
        XCTAssertTrue(w <= Vector([4, 2, 1]))
    }
    
    func testLesser() {
        let v = Vector([1, 2, 3])
        let w = Vector([3, 2, 1])
        
        XCTAssertFalse(v < Vector([1, 2, 3]))
        XCTAssertTrue(w < Vector([4, 2, 1]))
    }
    
    func testGreaterEqual() {
        let v = Vector([1, 2, 3])
        let w = Vector([3, 2, 1])
        
        XCTAssertTrue(v >= Vector([1, 2, 3]))
        XCTAssertTrue(w >= Vector([2, 2, 1]))
    }
    
    func testGreater() {
        let v = Vector([1, 2, 3])
        let w = Vector([3, 2, 1])
        
        XCTAssertFalse(v > Vector([1, 2, 3]))
        XCTAssertTrue(w > Vector([2, 2, 1]))
    }
    
    //MARK: - Arithmetic
    func testPlus() {
        let v = Vector([1, 2, 3])
        let w = Vector([3, 2, 1])
        
        XCTAssertEqual(v + w, Vector([4, 4, 4]))
    }
    
    func testPlusEqual() {
        var v = Vector([1, 2, 3])
        let w = Vector([3, 2, 1])
        
        v += w
        
        XCTAssertEqual(v, Vector([4, 4, 4]))
    }
    
    func testMinus() {
        let v = Vector([4, 4, 4])
        let w = Vector([3, 2, 1])
        
        XCTAssertEqual(v - w, Vector([1, 2, 3]))
    }
    
    func testMinusEqual() {
        var v = Vector([4, 4, 4])
        let w = Vector([3, 2, 1])
        
        v -= w
        
        XCTAssertEqual(v, Vector([1, 2, 3]))
    }
    
    func testAsterisk() {
        let v = Vector([1, 2, 4])
        let w = 3
        
        XCTAssertEqual(v * w, Vector([3, 6, 12]))
        XCTAssertEqual(w * v, Vector([3, 6, 12]))
    }
    
    func testAsteriskEqual() {
        var v = Vector([1, 2, 4])
        let w = 3
        
        v *= w
        
        XCTAssertEqual(v, Vector([3, 6, 12]))
    }
    
    func testBackslash() {
        let v = Vector([3, 6, 12])
        let w = 3
        
        XCTAssertEqual(v / w, Vector([1, 2, 4]))
    }
    
    func testBackslashEqual() {
        XCTAssertEqual(0, 1)
    }
    
    func testAsteriskAsterisk() {
        let v = Vector([3, 6, 12])
        let w = Vector([1, 2, 3])
        
        XCTAssertEqual(v ** w, 51)
    }
    
    func testPlusAsterisk() {
        let v = Vector([1, 7, 4])
        let w = Vector([4, 8, 3])
        
        XCTAssertEqual(v +* w, Vector([-11, 13, -20]))
    }
    
    func testNegate() {
        var v = Vector([3, 6, 12])
        v.negate()
        
        XCTAssertEqual(v, Vector([-3, -6, -12]))
    }
}
