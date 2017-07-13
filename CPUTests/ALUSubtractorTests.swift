//
//  ALUSubtractorTests.swift
//  CPUTests
//
//  Created by Skylar Schipper on 7/11/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import XCTest
@testable import CPU

class ALUSubtractorTests: XCTestCase {
    // MARK: - Half Sub Truth Table
    func testHalfSub_0_0() {
        let (diff, borrow) = ALU.Subtractor.half(0, 0)
        XCTAssertEqual(diff, 0)
        XCTAssertEqual(borrow, 0)
    }

    func testHalfSub_1_0() {
        let (diff, borrow) = ALU.Subtractor.half(1, 0)
        XCTAssertEqual(diff, 1)
        XCTAssertEqual(borrow, 0)
    }

    func testHalfSub_0_1() {
        let (diff, borrow) = ALU.Subtractor.half(0, 1)
        XCTAssertEqual(diff, 1)
        XCTAssertEqual(borrow, 1)
    }

    func testHalfSub_1_1() {
        let (diff, borrow) = ALU.Subtractor.half(1, 1)
        XCTAssertEqual(diff, 0)
        XCTAssertEqual(borrow, 0)
    }

    // MARK: - Full Sub Truth Table
    func testFullSub_0_0_0() {
        let (diff, borrow) = ALU.Subtractor.full(0, 0, 0)
        XCTAssertEqual(diff, 0)
        XCTAssertEqual(borrow, 0)
    }

    func testFullSub_0_0_1() {
        let (diff, borrow) = ALU.Subtractor.full(0, 0, 1)
        XCTAssertEqual(diff, 1)
        XCTAssertEqual(borrow, 1)
    }

    func testFullSub_0_1_0() {
        let (diff, borrow) = ALU.Subtractor.full(0, 1, 0)
        XCTAssertEqual(diff, 1)
        XCTAssertEqual(borrow, 1)
    }

    func testFullSub_0_1_1() {
        let (diff, borrow) = ALU.Subtractor.full(0, 1, 1)
        XCTAssertEqual(diff, 0)
        XCTAssertEqual(borrow, 1)
    }

    func testFullSub_1_0_0() {
        let (diff, borrow) = ALU.Subtractor.full(1, 0, 0)
        XCTAssertEqual(diff, 1)
        XCTAssertEqual(borrow, 0)
    }

    func testFullSub_1_0_1() {
        let (diff, borrow) = ALU.Subtractor.full(1, 0, 1)
        XCTAssertEqual(diff, 0)
        XCTAssertEqual(borrow, 0)
    }

    func testFullSub_1_1_0() {
        let (diff, borrow) = ALU.Subtractor.full(1, 1, 0)
        XCTAssertEqual(diff, 0)
        XCTAssertEqual(borrow, 0)
    }

    func testFullSub_1_1_1() {
        let (diff, borrow) = ALU.Subtractor.full(1, 1, 1)
        XCTAssertEqual(diff, 1)
        XCTAssertEqual(borrow, 1)
    }

    // MARK: - Other Tests
    func testWordSub() {
        let (result, carry) = ALU.Subtractor.word(Byte(142).word, Byte(53).word)
        XCTAssertEqual(Byte(result).integer, 89)
        XCTAssertEqual(carry, 0)
    }

    func testNegativeWordSub() {
        // 53 - 142 = -89
        // -89 = 256 - 167 & (carry bit to borrow)
        let (result, carry) = ALU.Subtractor.word(Byte(53).word, Byte(142).word)
        XCTAssertEqual(Byte(result).integer, 167)
        XCTAssertEqual(carry, 1)
    }
}
