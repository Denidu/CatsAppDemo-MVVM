//
//  CatModel.swift
//  CatsAppDemo
//
//  Created by Denidu Gamage on 2024-10-24.
//

import Foundation

struct CatModel: Codable, Hashable, Identifiable {
    let id: String
    let name: String
    let temperament: String
    let description: String
    let ImageId: String?
    let vetstreetURL: String?
    let vcahospitalsURL: String?
    let origin: String?
    let countryCodes: String?
    let countryCode: String?
    let lifeSpan: String?
    let indoor: Int?
    let lap: Int?
    let altNames: String?
    let adaptability: Int?
    let affectionLevel: Int?
    let childFriendly: Int?
    let dogFriendly: Int?
    let energyLevel: Int?
    let grooming: Int?
    let healthIssues: Int?
    let intelligence: Int?
    let sheddingLevel: Int?
    let socialNeeds: Int?
    let strangerFriendly: Int?
    let vocalisation: Int?
    let experimental: Int?
    let hairless: Int?
    let natural: Int?
    let rare: Int?
    let rex: Int?
    let suppressedTail: Int?
    let shortLegs: Int?
    let wikipediaURL: String?
    let hypoallergenic: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name, temperament, description
        case ImageId = "reference_image_id"
        case vetstreetURL = "vetstreet_url"
        case vcahospitalsURL = "vcahospitals_url"
        case origin
        case countryCodes = "country_codes"
        case countryCode = "country_code"
        case lifeSpan = "life_span"
        case indoor, lap
        case altNames = "alt_names"
        case adaptability
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case grooming
        case healthIssues = "health_issues"
        case intelligence
        case sheddingLevel = "shedding_level"
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
        case vocalisation, experimental, hairless, natural, rare, rex
        case suppressedTail = "suppressed_tail"
        case shortLegs = "short_legs"
        case wikipediaURL = "wikipedia_url"
        case hypoallergenic
    }
}


