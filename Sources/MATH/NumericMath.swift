//
//  NumericMath.swift
//  MATH
//
//  Created by Logan Richards on 9/9/21.
//

import Foundation

public struct NumericMath {
    @available(*, unavailable) private init() {}
    
    //MARK: Absolute Value
    public static func abs<Element: SignedNumeric & Comparable>(_ value: Element) -> Element {
        if(value < 0) {
            return -value
        } else {
            return value
        }
    }
    
    //MARK: Square Root
    public static func squareRoot<Element: Numeric>(_ value: Element) -> Element {
        
        
        
        return 0
    }
    
    //TODO: Cube Root
    //TODO: nth Root
    //TODO: Logarithm
    //TODO: Nartural Logarithm
    //TODO: sin
    //TODO: inverse sin
    //TODO: cos
    //TODO: inverse cos
    //TODO: tan
    //TODO: inverse tan
    //TODO: pi
    //TODO: e
    //TODO: summation
}
