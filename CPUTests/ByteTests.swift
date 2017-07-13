//
//  ByteTests.swift
//  CPUTests
//
//  Created by Skylar Schipper on 7/11/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import XCTest
@testable import CPU

class ByteTests: XCTestCase {
    func testCreatingFromNumber() {
        do {
            let byte: Byte = 128
            XCTAssertEqual(byte, Byte(int: 0b10000000))
        }

        do {
            let byte: Byte = 255
            XCTAssertEqual(byte, Byte(int: 0b11111111))
        }

        do {
            let byte: Byte = 149
            XCTAssertEqual(byte, Byte(int: 0b10010101))
        }
    }

    func testCreatingIntegerFromByte() {
        do {
            let byte = Byte(int: 0b10000000)
            XCTAssertEqual(byte.integer, 128)
        }

        do {
            let byte = Byte(int: 0b11111111)
            XCTAssertEqual(byte.integer, 255)
        }

        do {
            let byte = Byte(int: 0b10010101)
            XCTAssertEqual(byte.integer, 149)
        }
    }
}
