//
//  Word.swift
//  CPU
//
//  Created by Skylar Schipper on 7/11/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import Foundation

public struct Word {
    public static let null = Word(b0: 0, b1: 0, b2: 0, b3: 0, b4: 0, b5: 0, b6: 0, b7: 0)
    
    let b0: Bit
    let b1: Bit
    let b2: Bit
    let b3: Bit
    let b4: Bit
    let b5: Bit
    let b6: Bit
    let b7: Bit

    public init(b0: Bit, b1: Bit, b2: Bit, b3: Bit, b4: Bit, b5: Bit, b6: Bit, b7: Bit) {
        self.b0 = b0
        self.b1 = b1
        self.b2 = b2
        self.b3 = b3
        self.b4 = b4
        self.b5 = b5
        self.b6 = b6
        self.b7 = b7
    }

    internal init(_ int: UInt8) {
        var byte = int
        var bits = [Bit]()
        for _ in 0..<8 {
            bits.append(Bit(integerLiteral: byte & 0x01))
            byte >>= 1
        }
        self.init(
            b0: bits[0],
            b1: bits[1],
            b2: bits[2],
            b3: bits[3],
            b4: bits[4],
            b5: bits[5],
            b6: bits[6],
            b7: bits[7]
        )
    }
}

extension Word : ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = UInt8

    public init(integerLiteral value: UInt8) {
        self.init(value)
    }
}

extension Word {
    internal var int: UInt8 {
        return (
            BitValue(128, self.b7) +
            BitValue(64, self.b6) +
            BitValue(32, self.b5) +
            BitValue(16, self.b4) +
            BitValue(8, self.b3) +
            BitValue(4, self.b2) +
            BitValue(2, self.b1) +
            BitValue(1, self.b0)
        )
    }
}

fileprivate func BitValue(_ pos: UInt8, _ bit: Bit) -> UInt8 {
    return pos * (bit == .high ? 1 : 0)
}
