//
//  PreviewProvider.swift
//  SwiftCoin
//
//  Created by admin on 26.07.2023.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return .instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()

    let stat1 = StatisticModel(title: "Current Price", value: "$21,543.00", percentageChange: 1.23)
    let stat2 = StatisticModel(title: "Market Capitilization", value: "413.15Bn", percentageChange: 1.67)
    let stat3 = StatisticModel(title: "Rank", value: "1", percentageChange: nil)
    let stat4 = StatisticModel(title: "Volume", value: "35.00Bn", percentageChange: nil)

    let sectionModel = CoinDetailSectionModel(title: "Overview", stats: [
        StatisticModel(title: "Current Price", value: "$21,543.00", percentageChange: 1.23),
        StatisticModel(title: "Market Capitilization", value: "413.15Bn", percentageChange: 1.67),
        StatisticModel(title: "Rank", value: "1", percentageChange: nil),
        StatisticModel(title: "Volume", value: "35.00Bn", percentageChange: nil),
    ])

    let coin = Coin(id: "1", name: "Bitcoin", symbol: "BTC", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: 29227, totalVolume: 9_964_223_537, marketRank: 1, marketCap: 568_366_619_437, marketCapChange: 1_950_962_135, priceChange24H: 31.78, priceChangePercentage: 0.27914, high24H: 29096, low24H: 29304, marketCapChangePercentage: 0.344, sparkLineIn7D: .init(price: [
        30108.294324529867, 30039.392592721255, 30034.22459787704,
        29948.78335372274, 30017.251004800255, 29986.289240669008,
        29998.831260810937, 29951.256144329065, 30034.867182143484,
        29856.46606402171, 29972.57987673917, 29897.62289080843,
        30005.41844272265, 30061.78700852578, 30053.623926933968,
        29964.378847682037, 29931.688905793973, 29874.425223409846,
        29919.87483825516, 29979.064119378465, 29992.910883151122,
        29982.840639712784, 29942.891564929898, 29963.356299764248,
        30163.462139547373, 30117.441271351483, 30223.949743783734,
        30238.9812609946, 30359.89541697757, 30310.77543310859,
        30309.698288604668, 30227.460916832326, 30240.030952825608,
        29749.596950385137, 29815.48611838658, 29706.164603543035,
        29765.9220216076, 29742.582897878507, 29732.65285572856,
        29710.27319742336, 29863.762483750044, 29803.97250385206,
    ]), lastUpdated: "2023-07-26T09:14:36.824Z")
}
