//
//  LogicGate.swift
//  CPU
//
//  Created by Skylar Schipper on 7/11/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import Foundation

// Gives a high output only if all its inputs are high
func ANDGate(_ a: Bit, _ b: Bit) -> Bit {
    if (a == .high && b == .high) {
        return .high
    }
    return .low
}

// Gives a high output (1) if one or more of its inputs are high
func ORGate(_ a: Bit, _ b: Bit) -> Bit {
    if (a == .high || b == .high) {
        return .high
    }
    return .low
}

// Produces an inverted version of the input at its output
func NOTGate(_ a: Bit) -> Bit {
    if (a == .high) {
        return .low
    } else {
        return .high
    }
}

// Outputs of NAND gates are high if any of the inputs are low
func NANDGate(_ a: Bit, _ b: Bit) -> Bit {
    return NOTGate(ANDGate(a, b))
}

// Outputs of all NOR gates are low if any of the inputs are high
func NORGate(_ a: Bit, _ b: Bit) -> Bit {
    return NOTGate(ORGate(a, b))
}

// Gives a high output if either, but not both, of its two inputs are high
func EORGate(_ a: Bit, _ b: Bit) -> Bit {
    if (a == b) {
        return .low
    }
    return .high
}

// Give a low output if either, but not both, of its two inputs are high
func ENORGate(_ a: Bit, _ b: Bit) -> Bit {
    return NOTGate(EORGate(a, b))
}
