//
//  ChartData.swift
//  SwiftCoin
//
//  Created by admin on 26.07.2023.
//

import Foundation

struct ChartData: Identifiable {
    let id = UUID().uuidString
    let date: Date
    let value: Double
}
