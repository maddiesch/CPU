//
//  Instruction.swift
//  CPU
//
//  Created by Skylar Schipper on 7/12/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

/// CPU Instructions
public enum Instruction : UInt8 {
    /// Add the value of r1 to r2 (r1 + r2)
    /// Result is returned in r0
    /// Carry bit returned in r7 msb
    case add = 0b0000001

    /// Subtract the value of r2 from r1 (r1 - r2)
    /// Result is returned in r0
    /// Carry bit returned in r7 msb
    case sub = 0b0000010

    /// Left shift the value of r1
    /// Result is returned in r0
    case lsh = 0b0000011

    /// Right shift the value of r1
    /// Result is returned in r0
    case rsh = 0b0000100

    /// And the value of r1 with r2
    /// Result is returned in r0
    case and = 0b0000101

    /// Or the value of r1 with r2
    /// Result is returned in r0
    case orr = 0b0000110

    /// EOR the value of r1 with r2
    /// Result is returned in r0
    case eor = 0b0000111

    /// Sets the value stored in the val register into register pointed to by rp
    case set = 0b0001000

    /// Print the value from the register pointed to by the rp
    case pts = 0b0001001

    public var word: Word {
        return Word(self.rawValue)
    }

    public init?(_ word: Word) {
        self.init(rawValue: word.int)
    }
}
