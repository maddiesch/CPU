//
//  CPU.swift
//  CPU
//
//  Created by Skylar Schipper on 7/12/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

public final class CPU {
    /// The instruction register
    public let ins = InstructionRegister()

    // MARK: - Registers

    /// The return register
    public let r0 = ReadRegister()

    /// The first argument register
    public let r1 = ReadRegister()

    /// The second argument register
    public let r2 = ReadRegister()

    /// The third argument register
    public let r3 = ReadRegister()

    /// The fourth argument register
    public let r4 = ReadRegister()

    /// The fifth argument register
    /// The third auxiliary return register
    public let r5 = ReadRegister()

    /// The sixth argument register
    /// The second auxiliary return register
    public let r6 = ReadRegister()

    /// The seventh argument register
    /// The first auxiliary return register
    public let r7 = ReadRegister()

    // MARK: - Pointer Registers

    /// The first memory pointer register
    public let p0 = ReadRegister()

    /// The second memory pointer register
    public let p1 = ReadRegister()

    /// The third memory pointer register
    public let p2 = ReadRegister()

    /// The fourth memory pointer register
    public let p3 = ReadRegister()

    /// The memory pointer register
    public let idx = ReadRegister()

    /// The value to load
    public let val = WriteRegister()

    /// The register pointer
    public let rp = PointerRegister()

    /// Perform the instruction stored in ins
    ///
    /// - Throws: A CPUError if there isn't a valid instruction in ins
    public func exec() throws {
        guard let instruction = Instruction(self.ins.word) else {
            throw CPUError("UNKNOWN INSTRUCTION")
        }
        switch instruction {
        case .add:
            let (result, carry) = ALU.Adder.word(self.r1.word, self.r2.word)
            self.r0._load(result)
            self.r7._load(Word(b0: 0, b1: 0, b2: 0, b3: 0, b4: 0, b5: 0, b6: 0, b7: carry))
        case .sub:
            let (result, borrow) = ALU.Subtractor.word(self.r1.word, self.r2.word)
            self.r0._load(result)
            self.r7._load(Word(b0: 0, b1: 0, b2: 0, b3: 0, b4: 0, b5: 0, b6: 0, b7: borrow))
        case .lsh:
            let result = ALU.BitShift.lshift(self.r1.word)
            self.r0._load(result)
        case .rsh:
            let result = ALU.BitShift.rshift(self.r1.word)
            self.r0._load(result)
        case .and:
            let result = ALU.Bitwise.and(self.r1.word, self.r2.word)
            self.r0._load(result)
        case .orr:
            let result = ALU.Bitwise.or(self.r1.word, self.r2.word)
            self.r0._load(result)
        case .eor:
            let result = ALU.Bitwise.eor(self.r1.word, self.r2.word)
            self.r0._load(result)
        case .set:
            let value = self.val.word
            guard let rp = RegisterPointer(self.rp.word) else {
                throw CPUError("Invalid register pointer at RP")
            }
            self.set(value, rp)
        case .pts:
            guard let rp = RegisterPointer(self.rp.word) else {
                throw CPUError("Invalid register pointer at RP")
            }
            let value = self.get(rp).word
            print(Byte(value).debugDescription)
        }
    }

    private func set(_ value: Word, _ rp: RegisterPointer) {
        self.get(rp)._load(value)
    }

    private func get(_ rp: RegisterPointer) -> ReadRegister {
        switch rp {
        case .r0:
            return self.r0
        case .r1:
            return self.r1
        case .r2:
            return self.r2
        case .r3:
            return self.r3
        case .r4:
            return self.r4
        case .r5:
            return self.r5
        case .r6:
            return self.r6
        case .r7:
            return self.r7
        case .p0:
            return self.p0
        case .p1:
            return self.p1
        case .p2:
            return self.p2
        case .p3:
            return self.p3
        }
    }
}

public struct CPUError : Error {
    public let message: String
    public let isRecoverable: Bool

    init(_ message: String, _ isRecoverable: Bool = false) {
        self.message = message
        self.isRecoverable = isRecoverable
    }
}

extension CPU : CustomDebugStringConvertible {
    public var debugDescription: String {
        let str = """
        CPU:
            ins: \(self.ins)

            rp:  \(self.rp)
            val: \(self.val)
            idx: \(self.idx)

            r0:  \(self.r0)
            r1:  \(self.r1)
            r2:  \(self.r2)
            r3:  \(self.r3)
            r4:  \(self.r4)
            r5:  \(self.r5)
            r6:  \(self.r6)
            r7:  \(self.r7)

            p0:  \(self.p0)
            p1:  \(self.p1)
            p2:  \(self.p2)
            p3:  \(self.p3)
        """
        return str
    }


}
