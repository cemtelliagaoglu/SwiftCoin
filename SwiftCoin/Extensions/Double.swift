//
//  Double.swift
//  SwiftCoin
//
//  Created by admin on 25.07.2023.
//

import Foundation

extension Double {
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }

    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }

    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? "0.00"
    }

    func toPercentString() -> String {
        guard let percentString = numberFormatter.string(for: self) else { return "0.00%" }
        return percentString + "%"
    }
}
