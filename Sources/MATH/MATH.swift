import Foundation

public struct MATH {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}


precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
extension Int {
    public static func *= (lhs: inout [Int], rhs: Int) {
        for i in 0..<lhs.count {
            lhs[i] *= rhs
        }
    }
    
    public static func ^^ (radix: Int, power: Int) -> Int {
        return Int(pow(Double(radix), Double(power)))
    }
}
