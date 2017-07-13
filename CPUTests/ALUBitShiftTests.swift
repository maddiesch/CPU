//
//  ALUBitShiftTests.swift
//  CPUTests
//
//  Created by Skylar Schipper on 7/12/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import XCTest
@testable import CPU

class ALUBitShiftTests: XCTestCase {
    func testLShift() {
        let byte = Byte(int: 125)
        let result = ALU.BitShift.lshift(byte.word)
        XCTAssertEqual(Byte(result).integer, 250)
    }

    func testRShift() {
        let byte = Byte(int: 125)
        let result = ALU.BitShift.rshift(byte.word)
        XCTAssertEqual(Byte(result).integer, 62)
    }
}
