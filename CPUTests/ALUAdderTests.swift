//
//  ALUAdderTests.swift
//  CPUTests
//
//  Created by Skylar Schipper on 7/11/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import XCTest
@testable import CPU

class ALUAdderTests: XCTestCase {
    // MARK: - Half Adder Truth Table
    func testHalfAdder_0_0() {
        let (sum, carry) = ALU.Adder.half(0, 0)
        XCTAssertEqual(sum, 0)
        XCTAssertEqual(carry, 0)
    }

    func testHalfAdder_1_0() {
        let (sum, carry) = ALU.Adder.half(1, 0)
        XCTAssertEqual(sum, 1)
        XCTAssertEqual(carry, 0)
    }

    func testHalfAdder_0_1() {
        let (sum, carry) = ALU.Adder.half(0, 1)
        XCTAssertEqual(sum, 1)
        XCTAssertEqual(carry, 0)
    }

    func testHalfAdder_1_1() {
        let (sum, carry) = ALU.Adder.half(1, 1)
        XCTAssertEqual(sum, 0)
        XCTAssertEqual(carry, 1)
    }

    // MARK: - Full Adder Truth Table
    func testFullAdder_0_0_0() {
        let (sum, carry) = ALU.Adder.full(0, 0, 0)
        XCTAssertEqual(sum, 0)
        XCTAssertEqual(carry, 0)
    }

    func testFullAdder_0_0_1() {
        let (sum, carry) = ALU.Adder.full(0, 0, 1)
        XCTAssertEqual(sum, 1)
        XCTAssertEqual(carry, 0)
    }

    func testFullAdder_0_1_0() {
        let (sum, carry) = ALU.Adder.full(0, 1, 0)
        XCTAssertEqual(sum, 1)
        XCTAssertEqual(carry, 0)
    }

    func testFullAdder_0_1_1() {
        let (sum, carry) = ALU.Adder.full(0, 1, 1)
        XCTAssertEqual(sum, 0)
        XCTAssertEqual(carry, 1)
    }

    func testFullAdder_1_0_0() {
        let (sum, carry) = ALU.Adder.full(1, 0, 0)
        XCTAssertEqual(sum, 1)
        XCTAssertEqual(carry, 0)
    }

    func testFullAdder_1_0_1() {
        let (sum, carry) = ALU.Adder.full(1, 0, 1)
        XCTAssertEqual(sum, 0)
        XCTAssertEqual(carry, 1)
    }

    func testFullAdder_1_1_0() {
        let (sum, carry) = ALU.Adder.full(1, 1, 0)
        XCTAssertEqual(sum, 0)
        XCTAssertEqual(carry, 1)
    }

    func testFullAdder_1_1_1() {
        let (sum, carry) = ALU.Adder.full(1, 1, 1)
        XCTAssertEqual(sum, 1)
        XCTAssertEqual(carry, 1)
    }

    // MARK: - Other Tests
    func testWordAdder() {
        do {
            let (result, carry) = ALU.Adder.word(Byte(53).word, Byte(142).word)
            XCTAssertEqual(Byte(result).integer, 195)
            XCTAssertEqual(carry, 0)
        }
    }
}
