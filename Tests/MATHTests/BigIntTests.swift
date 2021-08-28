import XCTest
@testable import MATH

final class BigIntTests: XCTestCase {
    
    func testInit() {
        XCTAssertEqual(BigInt(120).source, [1, 2, 0])
    }
    
    func testFactorial() {
        XCTAssertEqual(BigInt().factorial(n: 5), [1, 2, 0])
        XCTAssertEqual(BigInt().factorial(n: 8), [4, 0, 3, 2, 0])
        XCTAssertEqual(BigInt().factorial(n: 21), [5, 1, 0, 9, 0, 9, 4, 2, 1, 7, 1, 7, 0, 9, 4, 4, 0, 0, 0, 0])
    }
    
    func testAddition() {
        XCTAssertEqual(BigInt().addition([1, 2, 0], [2, 4, 8]), [3, 6, 8])
    }
}
