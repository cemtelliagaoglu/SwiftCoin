//
//  Endpoint.swift
//  SwiftCoin
//
//  Created by admin on 25.07.2023.
//

import Foundation

public protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
}

public extension Endpoint {
    var scheme: String {
        "https"
    }

    var host: String {
        "api.coingecko.com"
    }
}
