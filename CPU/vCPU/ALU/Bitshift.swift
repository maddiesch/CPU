//
//  Bitshift.swift
//  CPU
//
//  Created by Skylar Schipper on 7/11/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

extension ALU {
    internal struct BitShift {
        internal static func lshift(_ a: Word) -> Word {
            return Word(
                b0: .low,
                b1: a.b0,
                b2: a.b1,
                b3: a.b2,
                b4: a.b3,
                b5: a.b4,
                b6: a.b5,
                b7: a.b6
            )
        }

        internal static func rshift(_ a: Word) -> Word {
            return Word(
                b0: a.b1,
                b1: a.b2,
                b2: a.b3,
                b3: a.b4,
                b4: a.b5,
                b5: a.b6,
                b6: a.b7,
                b7: .low
            )
        }
    }
}
