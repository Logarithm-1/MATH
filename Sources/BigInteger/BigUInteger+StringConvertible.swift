// BigUInteger+StringConvertible.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

extension BigUInteger: CustomStringConvertible {
    public var description: String {
        return toString()
    }
}

extension BigUInteger: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "BigUInteger(size: \(bitWidth), string: \(toString()))"
    }
}

extension BigUInteger: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        return toString() + " (\(self.bitWidth) bits)"
    }
}
