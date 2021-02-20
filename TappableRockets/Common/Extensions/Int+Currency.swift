//
//  Int+Currency.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 20/02/2021.
//

import Foundation

extension Int {
    func dollarFormatted() -> String? {
        NumberFormatter.dollarCurrency.string(from: NSNumber(value: self))
    }
}

private extension NumberFormatter {
    static var dollarCurrency: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        return formatter
    }()
}
