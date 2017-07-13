//
//  Parser.swift
//  CPU
//
//  Created by Skylar Schipper on 7/12/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import Foundation

fileprivate class CurrentLine {
    enum State {
        case reading
        case comment
        case end
    }

    let number: Int

    init(_ number: Int) {
        self.number = number
    }

    fileprivate var state: State = .reading

    private var line: [Character] = []

    private var parts: [String] {
        var parts: [String] = []
        var part: [Character] = []

        self.line.forEach { c in
            switch c {
            case " ", ",":
                if part.count > 0 {
                    parts.append(String(part))
                    part.removeAll()
                }
            default:
                part.append(c)
            }
        }

        if part.count > 0 {
            parts.append(String(part))
        }

        return parts
    }

    fileprivate func append(_ c: Character) {
        if self.state == .reading {
            self.line.append(c)
        }
    }

    fileprivate func finalize() throws -> Execution? {
        if self.line.count == 0 {
            return nil
        }
        let parts = self.parts
        guard parts.count > 0  else {
            throw ParserError("COMMAND HAS NO PARTS LINE[\(self.number)]")
        }

        switch parts[0] {
        case "set":
            guard parts.count == 3 else {
                throw ParserError("EXPECTED 3 PARTS FOR LINE[\(self.number)]")
            }
            let rp = try FetchRegisterPointer(parts[1])
            let wd = try CreateWord(parts[2])
            return ExecutionSet(value: wd, pointer: rp)
        case "add":
            return ExecutionAdd()
        case "pts":
            guard parts.count == 2 else {
                throw ParserError("EXPECTED 2 PARTS FOR LINE[\(self.number)]")
            }
            let rp = try FetchRegisterPointer(parts[1])
            return ExecutionPrint(pointer: rp)
        default:
            throw ParserError("UNKNOWN COMMAND LINE[\(self.number)] `\(parts[0])`")
        }
    }
}

public final class Parser {
    private let content: String
    private var buffer: [Execution] = []
    private var current = CurrentLine(0)

    public init(content: String) {
        self.content = content
    }

    func parse() throws -> Executable {
        self.buffer = []
        self.current = CurrentLine(0)
        try self.content.forEach { c in
            try self.processChar(c)
        }
        try self.finishCurrent()
        return Executable(self.buffer)
    }

    private func processChar(_ c: Character) throws {
        switch c {
        case ";":
            self.current.state = .comment
        case "\n":
            try self.finishCurrent()
        default:
            self.current.append(c)
        }
    }

    private func finishCurrent() throws {
        self.current.state = .end
        if let event = try self.current.finalize() {
            self.buffer.append(event)
        }
        self.current = CurrentLine(self.current.number + 1)
    }
}

public struct ParserError : Error {
    let message: String

    init(_ message: String) {
        self.message = message
    }
}

fileprivate func FetchRegisterPointer(_ str: String) throws -> RegisterPointer {
    switch str {
    case "r0":
        return .r0
    case "r1":
        return .r1
    case "r2":
        return .r2
    case "r3":
        return .r3
    case "r4":
        return .r4
    case "r5":
        return .r5
    case "r6":
        return .r6
    case "r7":
        return .r7
    case "p0":
        return .p0
    case "p1":
        return .p1
    case "p2":
        return .p2
    case "p3":
        return .p3
    default:
        throw ParserError("UNKNOWN REGISTER POINTER \(str)")
    }
}

fileprivate func CreateWord(_ str: String) throws -> Word {
    guard let int = UInt8(str) else {
        throw ParserError("FAILED TO PARSE VALUE \(str)")
    }
    return Word(int)
}
