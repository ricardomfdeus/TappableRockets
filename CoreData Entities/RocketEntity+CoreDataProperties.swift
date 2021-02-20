//
//  RocketEntity+CoreDataProperties.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 20/02/2021.
//
//

import Foundation
import CoreData

extension RocketEntity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<RocketEntity> {
        return NSFetchRequest<RocketEntity>(entityName: "RocketEntity")
    }

    @NSManaged public var id: String
    @NSManaged public var imageUrl: String?
    @NSManaged public var name: String?
    @NSManaged public var successRate: Int32
    @NSManaged public var country: String?
    @NSManaged public var firstFlight: Date?
    @NSManaged public var active: Bool
    @NSManaged public var rocketDescription: String?
    @NSManaged public var costPerLaunch: String?
    @NSManaged public var wikipedia: String?
}

internal extension RocketEntity {
    func asRocketItem() -> RocketItem {
        RocketItem(imageUrl: imageUrl,
                   name: name,
                   successRate: Int(successRate),
                   firstFlight: firstFlight,
                   active: active,
                   country: country,
                   rocketDescription: rocketDescription,
                   costPerLaunch: costPerLaunch,
                   wikipedia: wikipedia,
                   id: id)
    }
}

internal extension Sequence where Element == RocketEntity {
    func asRocketItems() -> [RocketItem] {
        return self.compactMap { $0.asRocketItem() }
    }
}
