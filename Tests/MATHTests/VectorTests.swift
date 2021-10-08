import XCTest
@testable import MATH

final class VectorTests: XCTestCase {
    //MARK: - Initializers
    func testInitOne() {
        let v = MATH.Vector<Int>(dimensions: 5)
        
        XCTAssertEqual(v[0], 0)
        XCTAssertEqual(v[1], 0)
        XCTAssertEqual(v[2], 0)
        XCTAssertEqual(v[3], 0)
        XCTAssertEqual(v[4], 0)
    }
    
    func testInitTwo() {
        let v = MATH.Vector([1, 2, 3, 4, 5])
        
        XCTAssertEqual(v[0], 1)
        XCTAssertEqual(v[1], 2)
        XCTAssertEqual(v[2], 3)
        XCTAssertEqual(v[3], 4)
        XCTAssertEqual(v[4], 5)
    }
    
    func testDescription() {
        XCTAssertEqual(MATH.Vector([1, 2, 3]).description, "<1, 2, 3>")
    }
    
    //MARK: Modifiers
    func testGetSetXYZW() {
        var v = MATH.Vector<Int>()
        XCTAssertEqual(v.x, 0)
        XCTAssertEqual(v.y, 0)
        XCTAssertEqual(v.z, 0)
        XCTAssertEqual(v.w, 0)
        
        v.x = 5
        v.z = 23
        v.w = 42
        
        XCTAssertEqual(v.x, 5)
        XCTAssertEqual(v.y, 0)
        XCTAssertEqual(v.z, 23)
        XCTAssertEqual(v.w, 42)
    }
    
    func testDimensions() {
        XCTAssertEqual(MATH.Vector([1, 2, 3]).dimensions, 3)
        XCTAssertEqual(MATH.Vector([1, 2]).dimensions, 2)
        XCTAssertEqual(MATH.Vector([1, 2, 3, 4, 5]).dimensions, 5)
    }
    
    func testNonZeroTrainlingDimensions() {
        XCTAssertEqual(MATH.Vector([1, 2, 3, 0, 0]).nonZeroTrailingDimensions, 3)
        XCTAssertEqual(MATH.Vector([0, 2, 0]).nonZeroTrailingDimensions, 2)
        XCTAssertEqual(MATH.Vector([1, 0, 3, 4, 5, 0, 0]).nonZeroTrailingDimensions, 5)
    }
    
    func testSubscript() {
        var v = MATH.Vector( [1, 2, 3])
        XCTAssertEqual(v[0], 1)
        
        v[0] = 2
        
        XCTAssertEqual(v[0], 2)
    }
    
    //MARK: - Other
    func testMagnitudeOther() {
        XCTAssertEqual(MATH.Vector([1, 2, 3]).magnitude(from: MATH.Vector([3, 3, 1])), 3)
        
        XCTAssertEqual(MATH.Vector([1.5, 2, 3]).magnitude(from: MATH.Vector([3, 3, 1])), 2.6925824035672523)
    }
    
    func testMagnitudeOrgin() {
        XCTAssertEqual(MATH.Vector([3, 4]).magnitude(), 5)
    }
    
    func testDirictionOther() {
        XCTAssertEqual(MATH.Vector([3, 4, 3]).direction(from: MATH.Vector([3, 3, 1])), MATH.Vector([0, 1, 2]))
    }
    
    func testDirictionOrgin() {
        XCTAssertEqual(MATH.Vector([3, 4, 3]).direction(), MATH.Vector([-3, -4, -3]))
    }
    
    func testThetaOrgin() {
        XCTAssertEqual(MATH.Vector([3, 4]).theta(), 0.6420926159343305)
    }
    
    
    //MARK: - Compare
    func testEqualEqual() {
        let v = MATH.Vector([1, 2, 3])
        let w = MATH.Vector([3, 2, 1])
        
        XCTAssertTrue(v == MATH.Vector([1, 2, 3]))
        XCTAssertTrue(w == MATH.Vector([3, 2, 1]))
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
        let v = MATH.Vector<Int>([3, 6, 12])
        let w: Int = 3
        
        XCTAssertEqual(v / w, MATH.Vector([1, 2, 4]))
    }
    
    func testBackslashEqual() {
        var v = MATH.Vector<Int>([3, 6, 12])
        let w: Int = 3
        
        v /= w
        
        XCTAssertEqual(v, MATH.Vector([1, 2, 4]))
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
