//
//  Subtractor.swift
//  CPU
//
//  Created by Skylar Schipper on 7/11/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

extension ALU {
    internal struct Subtractor {
        /// Subtract two bits
        /// - Returns: 2 bits, (Difference, Borrow)
        internal static func half(_ a: Bit, _ b: Bit) -> (Bit, Bit) {
            let d = EORGate(a, b)
            let b = ANDGate(b, NOTGate(a))
            return (d, b)
        }

        internal static func full(_ a: Bit, _ b: Bit, _ br: Bit) -> (Bit, Bit) {
            let (d1, b1) = self.half(a, b)
            let (d2, b2) = self.half(d1, br)
            let bo = ORGate(b2, b1)
            return (d2, bo)
        }

        internal static func word(_ a: Word, _ b: Word) -> (Word, Bit) {
            let (s0, c0) = self.full(a.b0, b.b0, .low)
            let (s1, c1) = self.full(a.b1, b.b1, c0)
            let (s2, c2) = self.full(a.b2, b.b2, c1)
            let (s3, c3) = self.full(a.b3, b.b3, c2)
            let (s4, c4) = self.full(a.b4, b.b4, c3)
            let (s5, c5) = self.full(a.b5, b.b5, c4)
            let (s6, c6) = self.full(a.b6, b.b6, c5)
            let (s7, c7) = self.full(a.b7, b.b7, c6)
            return (Word(b0: s0, b1: s1, b2: s2, b3: s3, b4: s4, b5: s5, b6: s6, b7: s7), c7)
        }
    }
}
