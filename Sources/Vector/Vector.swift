// Vector.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

/// A `Vector` is a mathematical way to discribe both a magnitude and a direction.
public struct Vector<Element: FloatingPoint> {
    
    /// The `components` are how much the vecotor point's in each direction `(x, y, z, w,...)`
    public var components: [Element]
    
    public init(_ vector: [Element]) {
        self.components = vector
    }
}

//MARK: - Additional Initializers
extension Vector {
    /// A Vector that equates to 0, with different dimension sizes.
    public init(dimensions: Int) {
        let vector: [Element] = Array(repeating: 0, count: dimensions)
        self.init(vector)
    }
}

// MARK: - Basic properties
extension Vector {
    /// `{get set}` a component in the `Vector` where the first component starts at `index: 0`.
    public subscript(index: Int) -> Element {
        get {
            return index < dimensions ? components[index] : 0
        } set(newValue) {
            //Add dimensions until index can fit in to components
            while(index < dimensions) {
                dimensions += 1
            }
            
            components[index] = newValue
        }
    }
    
    /// The number of dimensions (the number of elements) in the `Vector`.
    public var dimensions: Int {
        get {
            return components.count
        } set(newValue) {
            while(components.count < newValue) {
                components.append(0)
            }
            
            while(components.count > 0 && components.count > newValue) {
                components.removeLast()
            }
        }
    }
    
    /// The number of dimensions, where it discludes the trailing zeros.
    ///
    /// For Example:
    ///
    ///     <1, 2, 0, 0, 0>.compactDimensions   //= 2 (2D)
    ///     <0, 0, 3>.compactDimensions         //= 3 (3D)
    ///     <1, 2, 0, 0, 3>.compactDimensions   //= 5 (5D)
    public var compactDimensions: Int {
        var countTrailingZeros: Int = 0
        
        for component in components.reversed() {
            if(component == 0) {//Component is a Trailing Zero
                countTrailingZeros += 1
            } else { //Component is not a trailing zero
                break
            }
        }
        
        return dimensions - countTrailingZeros
    }
    
    /// The `x` component (or the first element) in the `Vector`.
    public var x: Element {
        get {
            return self[0]
        } set(newValue) {
            self[0] = newValue
        }
    }
    
    /// The `y` component (or the second element) in the `Vector`.
    public var y: Element {
        get {
            return self[1]
        } set(newValue) {
            self[1] = newValue
        }
    }
    
    /// The `Z` component (or the third element) in the `Vector`.
    public var z: Element {
        get {
            return self[2]
        } set(newValue) {
            self[2] = newValue
        }
    }
    
    /// The `w` component (or the fourth element) in the `Vector`.
    public var w: Element {
        get {
            return self[3]
        } set(newValue) {
            self[3] = newValue
        }
    }
}
