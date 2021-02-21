//
//  RocketsModels.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 20/02/2021.
//

import Foundation
import UIKit

public struct RocketItem {
    public let imageUrls: [String]?
    public let name: String?
    public let successRate: Int?
    public let firstFlight: Date?
    public var active: Bool
    public let country: String?
    public let rocketDescription: String?
    public let costPerLaunch: String?
    public let wikipedia: String?
    public let id: String
    
    public var badgeColor: UIColor {
        guard let successRate = successRate else {
            return .white
        }
        
        if successRate >= 60 {
            return .green
        } else if successRate >= 30 {
            return .orange
        } else {
            return .red
        }
    }
}

internal extension Rocket {
    func asRocketItem() throws -> RocketItem {
        guard let id = id else { throw RocketsErrors.invalidId }
        
        return RocketItem(imageUrls: flickrImages,
                          name: name,
                          successRate: successRatePct,
                          firstFlight: firstFlight?.date(),
                          active: active ?? false,
                          country: country,
                          rocketDescription: rocketDescription,
                          costPerLaunch: costPerLaunch?.dollarFormatted(),
                          wikipedia: wikipedia,
                          id: id)
    }
}

internal extension Sequence where Element == Rocket {
    func asRocketItems() -> [RocketItem] {
        return self.compactMap { try? $0.asRocketItem() }
    }
}
