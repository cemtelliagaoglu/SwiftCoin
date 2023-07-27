//
//  RequestError.swift
//  SwiftCoin
//
//  Created by admin on 25.07.2023.
//

import Foundation

public enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case rateLimit
    case unexpectedStatusCode
    case unknown

    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        case .noResponse:
            return "Response error"
        case .rateLimit:
            return "You have reached the request limit. Please try again later."
        default:
            return "Unknown error"
        }
    }
}
