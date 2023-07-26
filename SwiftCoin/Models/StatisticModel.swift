//
//  StatisticModel.swift
//  SwiftCoin
//
//  Created by admin on 26.07.2023.
//

import Foundation

struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
}
