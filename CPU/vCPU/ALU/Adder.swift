//
//  Adder.swift
//  CPU
//
//  Created by Skylar Schipper on 7/11/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

extension ALU {
    internal struct Adder {
        /// Adds two bits
        ///
        /// - Returns: (sum, carry)
        internal static func half(_ a: Bit, _ b: Bit) -> (Bit, Bit) {
            let s = EORGate(a, b)
            let c = ANDGate(a, b)
            return (s, c)
        }

        /// Adds two bits and takes a carry from a previous operation
        internal static func full(_ a: Bit, _ b: Bit, _ c: Bit) -> (Bit, Bit) {
            let (s1, c1) = self.half(a, b)
            let (s2, c2) = self.half(s1, c)
            let c3 = ORGate(c1, c2)
            return (s2, c3)
        }

        /// Adds two words togeather and returns the new word
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
