//
//  Byte.swift
//  CPU
//
//  Created by Skylar Schipper on 7/11/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import Foundation

/// A Byte
public struct Byte {
    let b0: Bit
    let b1: Bit
    let b2: Bit
    let b3: Bit
    let b4: Bit
    let b5: Bit
    let b6: Bit
    let b7: Bit

    public init(_ word: Word) {
        self.b0 = word.b7
        self.b1 = word.b6
        self.b2 = word.b5
        self.b3 = word.b4
        self.b4 = word.b3
        self.b5 = word.b2
        self.b6 = word.b1
        self.b7 = word.b0
    }

    public init(int: UInt8) {
        self.init(Word(int))
    }

    public var word: Word {
        return Word(
            b0: self.b7,
            b1: self.b6,
            b2: self.b5,
            b3: self.b4,
            b4: self.b3,
            b5: self.b2,
            b6: self.b1,
            b7: self.b0)
    }

    public var integer: UInt8 {
        return self.word.int
    }
}

extension Byte : Equatable {
    public static func ==(lhs: Byte, rhs: Byte) -> Bool {
        return (
            lhs.b0 == rhs.b0 &&
            lhs.b1 == rhs.b1 &&
            lhs.b2 == rhs.b2 &&
            lhs.b3 == rhs.b3 &&
            lhs.b4 == rhs.b4 &&
            lhs.b5 == rhs.b5 &&
            lhs.b6 == rhs.b6 &&
            lhs.b7 == rhs.b7
        )
    }
}

extension Byte : ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = UInt8

    public init(integerLiteral value: UInt8) {
        self.init(int: value)
    }
}

extension Byte : CustomDebugStringConvertible {
    public var debugDescription: String {
        return "0b\(self.b0)\(self.b1)\(self.b2)\(self.b3)\(self.b4)\(self.b5)\(self.b6)\(self.b7)"
    }
}
