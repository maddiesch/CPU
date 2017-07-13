//
//  CPUTests.swift
//  CPUTests
//
//  Created by Skylar Schipper on 7/11/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import XCTest
@testable import CPU

class CPUTests: XCTestCase {
    func testADD() {
        let v1: Byte = 48
        let v2: Byte = 26
        let cpu = CPU()

        do { // Set v1 into first argument register
            cpu.ins.set(.set)
            cpu.val.load(v1)
            cpu.rp.set(.r1)
            try! cpu.exec()
        }

        do { // Set v1 into first argument register
            cpu.ins.set(.set)
            cpu.val.load(v2)
            cpu.rp.set(.r2)
            try! cpu.exec()
        }

        do { // Perform the add
            cpu.ins.set(.add)
            try! cpu.exec()
        }

        XCTAssertEqual(cpu.r0.word.int, 74)
    }
}
