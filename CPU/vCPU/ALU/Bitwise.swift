//
//  Bitwise.swift
//  CPU
//
//  Created by Skylar Schipper on 7/11/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

extension ALU {
    internal struct Bitwise {
        internal static func and(_ a: Word, _ b: Word) -> Word {
            return Word(
                b0: ANDGate(a.b0, b.b0),
                b1: ANDGate(a.b1, b.b1),
                b2: ANDGate(a.b2, b.b2),
                b3: ANDGate(a.b3, b.b3),
                b4: ANDGate(a.b4, b.b4),
                b5: ANDGate(a.b5, b.b5),
                b6: ANDGate(a.b6, b.b6),
                b7: ANDGate(a.b7, b.b7)
            )
        }

        internal static func or(_ a: Word, _ b: Word) -> Word {
            return Word(
                b0: ORGate(a.b0, b.b0),
                b1: ORGate(a.b1, b.b1),
                b2: ORGate(a.b2, b.b2),
                b3: ORGate(a.b3, b.b3),
                b4: ORGate(a.b4, b.b4),
                b5: ORGate(a.b5, b.b5),
                b6: ORGate(a.b6, b.b6),
                b7: ORGate(a.b7, b.b7)
            )
        }

        internal static func eor(_ a: Word, _ b: Word) -> Word {
            return Word(
                b0: EORGate(a.b0, b.b0),
                b1: EORGate(a.b1, b.b1),
                b2: EORGate(a.b2, b.b2),
                b3: EORGate(a.b3, b.b3),
                b4: EORGate(a.b4, b.b4),
                b5: EORGate(a.b5, b.b5),
                b6: EORGate(a.b6, b.b6),
                b7: EORGate(a.b7, b.b7)
            )
        }

        internal static func not(_ a: Word) -> Word {
            return Word(
                b0: NOTGate(a.b0),
                b1: NOTGate(a.b1),
                b2: NOTGate(a.b2),
                b3: NOTGate(a.b3),
                b4: NOTGate(a.b4),
                b5: NOTGate(a.b5),
                b6: NOTGate(a.b6),
                b7: NOTGate(a.b7)
            )
        }
    }
}
