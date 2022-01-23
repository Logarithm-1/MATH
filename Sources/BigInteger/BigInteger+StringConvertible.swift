// BigInteger+StringConvertible.swift
//
// This source file is part of the Swift Math open source project.
//
// Copyright (c) 2022 Logan Richards and the Swift Math project authors.
// Licensed under MIT
//
// See https://github.com/Logarithm-1/MATH/blob/main/LICENSE for license information

extension BigInteger: CustomStringConvertible {
    public var description: String {
        return toString()
    }
}

extension BigInteger: CustomDebugStringConvertible {
  public var debugDescription: String {
    "BigInteger(size: \(String(bitWidth)), string: \(toString())"
  }
}
