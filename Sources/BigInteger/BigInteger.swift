// BigInteger.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information
//
//

import Foundation

/// An integer with the max-limit of at least 1,000 bits.
///
/// TODO: Figure out the max-limit of bits
public struct BigInteger {
    /// An array of bits (Boolean's) representing the value of an integer.
    ///
    /// The first bit in the array is an boolean that represents the "one's" place. The second element in the array represents the "two's", where the third represents "four's" and so on.
    ///
    ///     source = [0, 0, 1, 1, 1, 0, 1, 0]
    ///     //Which would normally look like 0101 1100 or 92
    ///
    /// So the array would be read in rervse.
    internal var source: [Bool]
    
    /// A Boolean where if `true` the BigInteger is negative and if `false` it is positve.
    internal var negative: Bool
    
    /// A BigInteger constructed by specifying the source array and wether it is positive or negative.
    public init(source: [Bool], negative: Bool = false) {
        self.source = source
        self.negative = negative
    }
}
