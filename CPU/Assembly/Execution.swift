//
//  Execution.swift
//  CPU
//
//  Created by Skylar Schipper on 7/12/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import Foundation

protocol Execution {
    func exec(_ cpu: CPU) throws
}

struct ExecutionSet : Execution {
    let value: Word
    let pointer: RegisterPointer

    func exec(_ cpu: CPU) throws {
        cpu.ins.set(.set)
        cpu.val.load(self.value)
        cpu.rp.set(self.pointer)
        try cpu.exec()
    }
}

struct ExecutionAdd : Execution {
    func exec(_ cpu: CPU) throws {
        cpu.ins.set(.add)
        try cpu.exec()
    }
}

struct ExecutionPrint : Execution {
    let pointer: RegisterPointer

    func exec(_ cpu: CPU) throws {
        cpu.ins.set(.pts)
        cpu.rp.set(self.pointer)
        try cpu.exec()
    }
}
