//
//  String+Date.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 20/02/2021.
//

import Foundation

enum DateFormat: String {
    case yearMonthDay = "yyyy-MM-dd"
    case monthExtDayYear = "MMM d, yyyy"
}

extension String {
    func date(withFormat format: DateFormat = .yearMonthDay) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.date(from: self)
    }
}

extension Date {
    func dateString(withFormat format: DateFormat = .monthExtDayYear) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }
}
