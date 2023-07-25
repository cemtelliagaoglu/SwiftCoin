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
    let currentPrice: Double?
    let marketRank: Double?
    let priceChangePercentage: Double

    enum CodingKeys: String, CodingKey {
        case name, symbol, image, id
        case currentPrice = "current_price"
        case marketRank = "market_cap_rank"
        case priceChangePercentage = "price_change_percentage_24h"
    }
}
