//
//  CoinDetailsViewModel.swift
//  SwiftCoin
//
//  Created by admin on 26.07.2023.
//

import SwiftUI

class CoinDetailsViewModel {
    private let coin: Coin
    // chart config
    var chartData = [ChartData]()
    var startDate = Date()
    var endDate = Date()
    var minPrice = 0.0
    var maxPrice = 0.0
    var xAxisValues = [Date]()
    var yAxisValues = [Double]()

    var coinName: String {
        coin.name
    }

    var chartLineColor: Color {
        let priceChange = (coin.sparkLineIn7D.price.last ?? 0) - (coin.sparkLineIn7D.price.first ?? 0)
        return priceChange > 0 ? .green : .red
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
                                         value: marketCap.formatWithAbbreviations(),
                                         percentageChange: marketCapPercentChange)
        // rank stats
        let rank = coin.marketRank
        let rankStats = StatisticModel(title: "Rank",
                                       value: String(rank),
                                       percentageChange: nil)
        // volume stats
        let volume = coin.totalVolume
        let volumeStat = StatisticModel(title: "Volume",
                                        value: "$" + volume.formatWithAbbreviations(),
                                        percentageChange: nil)
        return CoinDetailSectionModel(title: "Overview",
                                      stats: [priceStats,
                                              marketStats,
                                              rankStats,
                                              volumeStat])
    }

    var additionalDetailsSectionModel: CoinDetailSectionModel {
        // 24H high
        let high = coin.high24H.toCurrency()
        let highStat = StatisticModel(title: "24H High",
                                      value: high,
                                      percentageChange: nil)
        // 24H low
        let low = coin.low24H.toCurrency()
        let lowStat = StatisticModel(title: "24H Low",
                                     value: low,
                                     percentageChange: nil)
        // 24H Price Change
        let priceChange = coin.priceChange24H
        let priceChangePercent = coin.priceChangePercentage
        let priceChangeStat = StatisticModel(title: "24H Price Change",
                                             value: "$" + priceChange.formatWithAbbreviations(),
                                             percentageChange: priceChangePercent)
        // 24H market cap Change
        let marketCapChange = coin.marketCapChange
        let marketCapChangePercent = coin.marketCapChangePercentage
        let marketCapStat = StatisticModel(title: "24H Market Cap Change",
                                           value: "$" + marketCapChange.formatWithAbbreviations(),
                                           percentageChange: marketCapChangePercent)
        return CoinDetailSectionModel(title: "Additional Details",
                                      stats: [highStat,
                                              lowStat,
                                              priceChangeStat,
                                              marketCapStat])
    }

    init(coin: Coin) {
        self.coin = coin
        configureChartData()
    }

    func configureChartData() {
        let priceData = coin.sparkLineIn7D.price
        var index = 0
        endDate = Date(coinGeckoString: coin.lastUpdated)
        startDate = endDate.addingTimeInterval(-7 * 60 * 60 * 24)
        minPrice = priceData.min() ?? 0
        maxPrice = priceData.max() ?? 0
        xAxisValues = [startDate, endDate]
        yAxisValues = [minPrice, (minPrice + maxPrice) / 2, maxPrice]

        for price in priceData.reversed() {
            let date = endDate.addingTimeInterval(-1 * 60 * 60 * Double(index))
            let chartDataItem = ChartData(date: date, value: price)
            chartData.append(chartDataItem)
            index += 1
        }
    }
}
