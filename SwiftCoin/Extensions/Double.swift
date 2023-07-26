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

    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }

    func formatWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            return "\(sign)\(formatted.asNumberString())Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            return "\(sign)\(formatted.asNumberString())Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            return "\(sign)\(formatted.asNumberString())M"
        case 1000...:
            let formatted = num / 1000
            return "\(sign)\(formatted.asNumberString())K"
        case 0...:
            return asNumberString()
        default:
            return "\(sign)\(asNumberString())"
        }
    }
}
