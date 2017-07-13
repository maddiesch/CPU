//
//  Executable.swift
//  CPU
//
//  Created by Skylar Schipper on 7/12/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

public struct Executable {
    let executions: [Execution]

    internal init(_ ex: [Execution]) {
        self.executions = ex
    }

    public func run(_ cpu: CPU) throws {
        for e in self.executions {
            try e.exec(cpu)
        }
    }
}
