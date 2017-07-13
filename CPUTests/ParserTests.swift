//
//  ParserTests.swift
//  CPUTests
//
//  Created by Skylar Schipper on 7/12/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import XCTest
@testable import CPU

class ParserTests: XCTestCase {
    func testParser() {
        let str = """
        ; Set the values to add
        set r1, 42
        set r2, 32
        ; Perform the add
        add ; The r1 & r2 values are added auto
        pts r0 ; Print the value
        """
        let parser = Parser(content: str)
        let exec = try! parser.parse()
        let cpu = CPU()
        try! exec.run(cpu)
        print(cpu.debugDescription)
        XCTAssertEqual(Byte(cpu.r0.word).integer, 74)
    }
}
