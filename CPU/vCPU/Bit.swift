//
//  Bit.swift
//  CPU
//
//  Created by Skylar Schipper on 7/11/17.
//  Copyright © 2017 Skylar Schipper. All rights reserved.
//

import Foundation


/// Represents a high or low value
///
/// - low: 0
/// - high: 1
public enum Bit {
    case low
    case high
}

extension Bit : Equatable {
}

extension Bit : ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = UInt8

    public init(integerLiteral value: UInt8) {
        switch value {
        case 0:
            self = .low
        case 1:
            self = .high
        default:
            fatalError("Must be 0 or 1")
        }
    }
}

extension Bit : CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .high:
            return "1"
        case .low:
            return "0"
        }
    }
}
