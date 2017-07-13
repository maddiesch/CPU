//
//  Register.swift
//  CPU
//
//  Created by Skylar Schipper on 7/12/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

public protocol Register : CustomDebugStringConvertible {
    var word: Word { get }
}

extension Register {
    public var debugDescription: String {
        return Byte(self.word).debugDescription
    }
}

/// CPU Register
public final class WriteRegister : Register {
    /// The Word stored in the register
    public private(set) var word: Word = Word.null

    /// Load a Byte into the Register
    public func load(_ byte: Byte) {
        self.load(byte.word)
    }

    /// Load a Word into the Register
    public func load(_ word: Word) {
        self.word = word
    }
}

/// Read only CPU Register
public final class ReadRegister : Register {
    public private(set) var word: Word = Word.null

    internal func _load(_ byte: Byte) {
        self._load(byte.word)
    }

    internal func _load(_ word: Word) {
        self.word = word
    }
}

/// The instruction register
public final class InstructionRegister : Register {
    public private(set) var word: Word = Word.null

    public func set(_ ins: Instruction) {
        self.word = ins.word
    }
}

// Register pointer regsiter
public final class PointerRegister : Register {
    public private(set) var word: Word = Word.null

    public func set(_ ins: RegisterPointer) {
        self.word = ins.word
    }
}

/// RP
public enum RegisterPointer : UInt8 {
    case r0 = 0b00000001
    case r1 = 0b00000010
    case r2 = 0b00000011
    case r3 = 0b00000100
    case r4 = 0b00000101
    case r5 = 0b00000110
    case r6 = 0b00000111
    case r7 = 0b00001000

    case p0 = 0b00010000
    case p1 = 0b00010001
    case p2 = 0b00010010
    case p3 = 0b00010011

    public var word: Word {
        return Word(self.rawValue)
    }

    public init?(_ word: Word) {
        self.init(rawValue: word.int)
    }
}
