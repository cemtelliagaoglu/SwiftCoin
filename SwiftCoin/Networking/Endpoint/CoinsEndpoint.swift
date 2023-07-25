//
//  AllCoinsEndpoint.swift
//  SwiftCoin
//
//  Created by admin on 25.07.2023.
//

import Foundation

public enum CoinsEndpoint: Endpoint {
    case all
}

public extension CoinsEndpoint {
    var queryItems: [URLQueryItem]? {
        return [
            URLQueryItem(name: "vs_currency", value: "usd"),
            URLQueryItem(name: "per_page", value: "100"),
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "sparkline", value: "true"),
            URLQueryItem(name: "pice_change_percentage", value: "24"),
            URLQueryItem(name: "locale", value: "en"),
        ]
    }

    var path: String {
        return "/api/v3/coins/markets"
    }

    var method: RequestMethod {
        .get
    }

    var body: [String: String]? {
        nil
    }

    var header: [String: String]? {
        nil
    }
}
