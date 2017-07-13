//
//  LogicGateTests.swift
//  CPUTests
//
//  Created by Skylar Schipper on 7/11/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import XCTest
@testable import CPU

class LogicGateTests: XCTestCase {
    func testANDGate() {
        XCTAssertEqual(ANDGate(.low, .low), .low)
        XCTAssertEqual(ANDGate(.low, .high), .low)
        XCTAssertEqual(ANDGate(.high, .low), .low)
        XCTAssertEqual(ANDGate(.high, .high), .high)
    }

    func testORGate() {
        XCTAssertEqual(ORGate(.low, .low), .low)
        XCTAssertEqual(ORGate(.low, .high), .high)
        XCTAssertEqual(ORGate(.high, .low), .high)
        XCTAssertEqual(ORGate(.high, .high), .high)
    }

    func testNOTGate() {
        XCTAssertEqual(NOTGate(.low), .high)
        XCTAssertEqual(NOTGate(.high), .low)
    }

    func testNANDGate() {
        XCTAssertEqual(NANDGate(.low, .low), .high)
        XCTAssertEqual(NANDGate(.low, .high), .high)
        XCTAssertEqual(NANDGate(.high, .low), .high)
        XCTAssertEqual(NANDGate(.high, .high), .low)
    }

    func testNORGate() {
        XCTAssertEqual(NORGate(.low, .low), .high)
        XCTAssertEqual(NORGate(.low, .high), .low)
        XCTAssertEqual(NORGate(.high, .low), .low)
        XCTAssertEqual(NORGate(.high, .high), .low)
    }

    func testEORGate() {
        XCTAssertEqual(EORGate(.low, .low), .low)
        XCTAssertEqual(EORGate(.low, .high), .high)
        XCTAssertEqual(EORGate(.high, .low), .high)
        XCTAssertEqual(EORGate(.high, .high), .low)
    }

    func testENORGate() {
        XCTAssertEqual(ENORGate(.low, .low), .high)
        XCTAssertEqual(ENORGate(.low, .high), .low)
        XCTAssertEqual(ENORGate(.high, .low), .low)
        XCTAssertEqual(ENORGate(.high, .high), .high)
    }
}
