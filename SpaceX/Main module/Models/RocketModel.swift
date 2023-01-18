//
//  RocketModel.swift
//  SpaceX
//
//  Created by Павел Яковенко on 18.01.2023.
//

import Foundation

struct RocketModel: Decodable {
    let name: String
    let height, diameter: Diameter
    let mass: Mass
    let payloadWeights: [PayloadWeight]
    let firstFlight, country, company: String
    let costPerLaunch: Int
    let firstStage: FirstStage
    let secondStage: SecondStage
}

struct FirstStage: Decodable {
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

// MARK: - SecondStage
struct SecondStage: Decodable {
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

// MARK: - Diameter
struct Diameter: Decodable {
    let meters, feet: Double?
}

// MARK: - Mass
struct Mass: Decodable {
    let kg, lb: Int
}

// MARK: - PayloadWeight
struct PayloadWeight: Decodable {
    let id, name: String
    let kg, lb: Int
}
