//
//  CoinDetailsViewModel.swift
//  SwiftCoin
//
//  Created by admin on 26.07.2023.
//

import Foundation

class CoinDetailsViewModel {
    private let coin: Coin
    var coinName: String {
        coin.name
    }

    var overviewSectionModel: CoinDetailSectionModel {
        // price stats
        let price = coin.currentPrice.toCurrency()
        let pricePercentage = coin.priceChangePercentage
        let priceStats = StatisticModel(title: "Current Price",
                                        value: price,
                                        percentageChange: pricePercentage)
        // market cap stats
        let marketCap = coin.marketCap
        let marketCapPercentChange = coin.marketCapChangePercentage
        let marketStats = StatisticModel(title: "Market Capitilization",
                                         value: String(marketCap),
                                         percentageChange: marketCapPercentChange)
        // rank stats
        let rank = coin.marketRank
        let rankStats = StatisticModel(title: "Rank",
                                       value: String(rank),
                                       percentageChange: nil)
        // volume stats
        let volume = coin.totalVolume
        let volumeStat = StatisticModel(title: "Volume",
                                        value: String(volume),
                                        percentageChange: nil)
        return CoinDetailSectionModel(title: "Overview",
                                      stats: [priceStats,
                                              marketStats,
                                              rankStats,
                                              volumeStat])
    }

    var additionalDetailsSectionModel: CoinDetailSectionModel {
        // 24H high
        let high = coin.high24H
        let highStat = StatisticModel(title: "24H High",
                                      value: String(high),
                                      percentageChange: nil)
        // 24H low
        let low = coin.low24H
        let lowStat = StatisticModel(title: "24H Low",
                                     value: String(low),
                                     percentageChange: nil)
        // 24H Price Change
        let priceChange = coin.priceChange24H
        let priceChangePercent = coin.priceChangePercentage
        let priceChangeStat = StatisticModel(title: "24H Price Change",
                                             value: String(priceChange),
                                             percentageChange: priceChangePercent)
        // 24H market cap Change
        let marketCapChange = coin.marketCapChange
        let marketCapChangePercent = coin.marketCapChangePercentage
        let marketCapStat = StatisticModel(title: "24H Market Cap Change",
                                           value: String(marketCapChange),
                                           percentageChange: marketCapChangePercent)
        return CoinDetailSectionModel(title: "Additional Details",
                                      stats: [highStat,
                                              lowStat,
                                              priceChangeStat,
                                              marketCapStat])
    }

    init(coin: Coin) {
        self.coin = coin
    }
}
