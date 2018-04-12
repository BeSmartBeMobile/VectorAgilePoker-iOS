//
//  VMRemoteConfigError.swift
//  Pods
//
//  Created by jmlucena on 17/5/17.
//
//

import Foundation

enum VMRemoteConfigError: Error {
    case couldNotDecodeJSON
    case badStatus(status: Int)
    case other(Error)
}

extension VMRemoteConfigError: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .couldNotDecodeJSON:
            return "Could not decode JSON"
        case let .badStatus(status):
            return "Bad status \(status)"
        case let .other(error):
            return "\(error)"
        }
    }
}
