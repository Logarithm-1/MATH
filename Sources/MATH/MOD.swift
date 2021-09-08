//
//  MOD.swift
//  MATH
//
//  Created by Logan Richards on 8/28/21.
//

import Foundation

//TODO: Greatest Common Denomator
//TODO: Euclidean Algorithm
//TODO: Divison
//TODO: Power
//TODO: Inverse Power

public struct MOD<Element: SignedInteger> {
    var value: Element
    var base: Element
    
    init(value: Element, base: Element) {
        self.base = base
        if(value < 0) {
            self.value = (self.base + (value % base)) % base
        } else {
            self.value = value % base
        }
    }
    
    init() {
        self.base = 0
        self.value = 0
    }
}
