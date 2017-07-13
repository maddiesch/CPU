//
//  ALUBitwiseTests.swift
//  CPUTests
//
//  Created by Skylar Schipper on 7/12/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import XCTest
@testable import CPU

class ALUBitwiseTests: XCTestCase {
    func testAND() {
        let byte1: Byte = 0b10110010
        let byte2: Byte = 0b10001110
        let truth: Byte = 0b10000010
        let result = ALU.Bitwise.and(byte1.word, byte2.word)
        XCTAssertEqual(Byte(result), truth)
    }

    func testOR() {
        let byte1: Byte = 0b10110010
        let byte2: Byte = 0b10001110
        let truth: Byte = 0b10111110
        let result = ALU.Bitwise.or(byte1.word, byte2.word)
        XCTAssertEqual(Byte(result), truth)
    }

    func testEOR() {
        let byte1: Byte = 0b10110010
        let byte2: Byte = 0b10001110
        let truth: Byte = 0b00111100
        let result = ALU.Bitwise.eor(byte1.word, byte2.word)
        XCTAssertEqual(Byte(result), truth)
    }

    func testNOT() {
        let byte1: Byte = 0b10110010
        let truth: Byte = 0b01001101
        let result = ALU.Bitwise.not(byte1.word)
        XCTAssertEqual(Byte(result), truth)
    }
}
