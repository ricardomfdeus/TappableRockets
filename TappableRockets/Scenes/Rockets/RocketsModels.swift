//
//  RocketsModels.swift
//  TappableRockets
//
//  Created by Ricardo Deus on 19/02/2021.
//

import Foundation

public typealias Rockets = [Rocket]

// MARK: - Rocket
public struct Rocket: Codable {
    public let height: Diameter?
    public let diameter: Diameter?
    public let mass: Mass?
    public let firstStage: FirstStage?
    public let secondStage: SecondStage?
    public let engines: Engines?
    public let landingLegs: LandingLegs?
    public let payloadWeights: [PayloadWeight]?
    public let flickrImages: [String]?
    public let name: String?
    public let type: String?
    public let active: Bool?
    public let stages: Int?
    public let boosters: Int?
    public let costPerLaunch: Int?
    public let successRatePct: Int?
    public let firstFlight: String?
    public let country: String?
    public let company: String?
    public let wikipedia: String?
    public let rocketDescription: String?
    public let id: String?
    
    enum CodingKeys: String, CodingKey {
        case height = "height"
        case diameter = "diameter"
        case mass = "mass"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case engines = "engines"
        case landingLegs = "landing_legs"
        case payloadWeights = "payload_weights"
        case flickrImages = "flickr_images"
        case name = "name"
        case type = "type"
        case active = "active"
        case stages = "stages"
        case boosters = "boosters"
        case costPerLaunch = "cost_per_launch"
        case successRatePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case country = "country"
        case company = "company"
        case wikipedia = "wikipedia"
        case rocketDescription = "description"
        case id = "id"
    }
    
    public init(height: Diameter?, diameter: Diameter?, mass: Mass?, firstStage: FirstStage?, secondStage: SecondStage?, engines: Engines?, landingLegs: LandingLegs?, payloadWeights: [PayloadWeight]?, flickrImages: [String]?, name: String?, type: String?, active: Bool?, stages: Int?, boosters: Int?, costPerLaunch: Int?, successRatePct: Int?, firstFlight: String?, country: String?, company: String?, wikipedia: String?, rocketDescription: String?, id: String?) {
        self.height = height
        self.diameter = diameter
        self.mass = mass
        self.firstStage = firstStage
        self.secondStage = secondStage
        self.engines = engines
        self.landingLegs = landingLegs
        self.payloadWeights = payloadWeights
        self.flickrImages = flickrImages
        self.name = name
        self.type = type
        self.active = active
        self.stages = stages
        self.boosters = boosters
        self.costPerLaunch = costPerLaunch
        self.successRatePct = successRatePct
        self.firstFlight = firstFlight
        self.country = country
        self.company = company
        self.wikipedia = wikipedia
        self.rocketDescription = rocketDescription
        self.id = id
    }
}

// MARK: - Diameter
public struct Diameter: Codable {
    public let meters: Double?
    public let feet: Double?
    
    public init(meters: Double?, feet: Double?) {
        self.meters = meters
        self.feet = feet
    }
}

// MARK: - Engines
public struct Engines: Codable {
    public let isp: ISP?
    public let thrustSeaLevel: Thrust?
    public let thrustVacuum: Thrust?
    public let number: Int?
    public let type: String?
    public let version: String?
    public let layout: String?
    public let engineLossMax: Int?
    public let propellant1: String?
    public let propellant2: String?
    public let thrustToWeight: Double?
    
    enum CodingKeys: String, CodingKey {
        case isp = "isp"
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case number = "number"
        case type = "type"
        case version = "version"
        case layout = "layout"
        case engineLossMax = "engine_loss_max"
        case propellant1 = "propellant_1"
        case propellant2 = "propellant_2"
        case thrustToWeight = "thrust_to_weight"
    }
    
    public init(isp: ISP?, thrustSeaLevel: Thrust?, thrustVacuum: Thrust?, number: Int?, type: String?, version: String?, layout: String?, engineLossMax: Int?, propellant1: String?, propellant2: String?, thrustToWeight: Double?) {
        self.isp = isp
        self.thrustSeaLevel = thrustSeaLevel
        self.thrustVacuum = thrustVacuum
        self.number = number
        self.type = type
        self.version = version
        self.layout = layout
        self.engineLossMax = engineLossMax
        self.propellant1 = propellant1
        self.propellant2 = propellant2
        self.thrustToWeight = thrustToWeight
    }
}

// MARK: - ISP
public struct ISP: Codable {
    public let seaLevel: Int?
    public let vacuum: Int?
    
    enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum = "vacuum"
    }
    
    public init(seaLevel: Int?, vacuum: Int?) {
        self.seaLevel = seaLevel
        self.vacuum = vacuum
    }
}

// MARK: - Thrust
public struct Thrust: Codable {
    public let kN: Int?
    public let lbf: Int?
    
    public init(kN: Int?, lbf: Int?) {
        self.kN = kN
        self.lbf = lbf
    }
}

// MARK: - FirstStage
public struct FirstStage: Codable {
    public let thrustSeaLevel: Thrust?
    public let thrustVacuum: Thrust?
    public let reusable: Bool?
    public let engines: Int?
    public let fuelAmountTons: Double?
    public let burnTimeSec: Int?
    
    enum CodingKeys: String, CodingKey {
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case reusable = "reusable"
        case engines = "engines"
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSec = "burn_time_sec"
    }
    
    public init(thrustSeaLevel: Thrust?, thrustVacuum: Thrust?, reusable: Bool?, engines: Int?, fuelAmountTons: Double?, burnTimeSec: Int?) {
        self.thrustSeaLevel = thrustSeaLevel
        self.thrustVacuum = thrustVacuum
        self.reusable = reusable
        self.engines = engines
        self.fuelAmountTons = fuelAmountTons
        self.burnTimeSec = burnTimeSec
    }
}

// MARK: - LandingLegs
public struct LandingLegs: Codable {
    public let number: Int?
    public let material: String?
    
    public init(number: Int?, material: String?) {
        self.number = number
        self.material = material
    }
}

// MARK: - Mass
public struct Mass: Codable {
    public let kg: Int?
    public let lb: Int?
    
    public init(kg: Int?, lb: Int?) {
        self.kg = kg
        self.lb = lb
    }
}

// MARK: - PayloadWeight
public struct PayloadWeight: Codable {
    public let id: String?
    public let name: String?
    public let kg: Int?
    public let lb: Int?
    
    public init(id: String?, name: String?, kg: Int?, lb: Int?) {
        self.id = id
        self.name = name
        self.kg = kg
        self.lb = lb
    }
}

// MARK: - SecondStage
public struct SecondStage: Codable {
    public let thrust: Thrust?
    public let payloads: Payloads?
    public let reusable: Bool?
    public let engines: Int?
    public let fuelAmountTons: Double?
    public let burnTimeSec: Int?
    
    enum CodingKeys: String, CodingKey {
        case thrust = "thrust"
        case payloads = "payloads"
        case reusable = "reusable"
        case engines = "engines"
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSec = "burn_time_sec"
    }
    
    public init(thrust: Thrust?, payloads: Payloads?, reusable: Bool?, engines: Int?, fuelAmountTons: Double?, burnTimeSec: Int?) {
        self.thrust = thrust
        self.payloads = payloads
        self.reusable = reusable
        self.engines = engines
        self.fuelAmountTons = fuelAmountTons
        self.burnTimeSec = burnTimeSec
    }
}

// MARK: - Payloads
public struct Payloads: Codable {
    public let compositeFairing: CompositeFairing?
    public let option1: String?
    
    enum CodingKeys: String, CodingKey {
        case compositeFairing = "composite_fairing"
        case option1 = "option_1"
    }
    
    public init(compositeFairing: CompositeFairing?, option1: String?) {
        self.compositeFairing = compositeFairing
        self.option1 = option1
    }
}

// MARK: - CompositeFairing
public struct CompositeFairing: Codable {
    public let height: Diameter?
    public let diameter: Diameter?
    
    public init(height: Diameter?, diameter: Diameter?) {
        self.height = height
        self.diameter = diameter
    }
}
