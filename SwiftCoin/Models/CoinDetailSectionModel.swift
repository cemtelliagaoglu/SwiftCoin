//
//  CoinDetailSectionModel.swift
//  SwiftCoin
//
//  Created by admin on 26.07.2023.
//

import Foundation

struct CoinDetailSectionModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let stats: [StatisticModel]
}
