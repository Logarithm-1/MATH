// BigUInteger+Integer.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

//MARK: - BinaryInteger
//Conform BigUInteger to BinaryInteger

extension BigUInteger {
    public static var isSigned: Bool {
        return false
    }
    
    
    public var trailingZeroBitCount: Int {
        return 0
    }
    
    public func hash(into hasher: inout Hasher) {
        //I Don't Know
    }
    
    public var isZero: Bool {
        return (self == 0)
    }
    
    public typealias Word = UInt
    
    public struct Words: RandomAccessCollection {
        private let value: BigUInteger
        
        init(_ value: BigUInteger) {
            self.value = value
        }
        
        public var startIndex: Int {
            return 0
        }
        
        public var endIndex: Int {
            return value.source.count
        }
        
        public subscript(_ index: Int) -> Word {
            return value[index] ? 1 : 0
        }
    }
    
    public var words: Words {
        return Words(self)
    }
}

//MARK: - SignedInteger
//Conform BigUInteger to SignedInteger
