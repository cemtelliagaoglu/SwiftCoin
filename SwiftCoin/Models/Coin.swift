//
//  Coin.swift
//  SwiftCoin
//
//  Created by admin on 25.07.2023.
//

import Foundation

struct Coin: Codable, Identifiable {
    let id: String
    let name: String
    let symbol: String
    let image: String
    let currentPrice, totalVolume: Double
    let marketRank, marketCap: Int
    let marketCapChange, priceChange24H,priceChangePercentage, high24H, low24H, marketCapChangePercentage: Double
    let sparkLineIn7D: SparklineIn7D

    enum CodingKeys: String, CodingKey {
        case name, symbol, image, id
        case marketCap = "market_cap"
        case marketCapChange = "market_cap_change_24h"
        case marketCapChangePercentage = "market_cap_change_percentage_24h"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case totalVolume = "total_volume"
        case currentPrice = "current_price"
        case marketRank = "market_cap_rank"
        case priceChangePercentage = "price_change_percentage_24h"
        case sparkLineIn7D = "sparkline_in_7d"
    }

    struct SparklineIn7D: Codable {
        let price: [Double]
    }
}
