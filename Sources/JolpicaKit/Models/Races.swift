//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

struct RaceTable: ResultData {
    static var resultKey: String { "RaceTable" }
    
    let season: String?
    let round: String?
    let lap: String?
    let races: [Race]
    
    enum CodingKeys: String, CodingKey {
        case season
        case round
        case lap
        case races = "Races"
    }
}

struct RaceTableAnd<T: RaceAdditionalData>: ResultData {
    static var resultKey: String { "RaceTable" }
    
    let season: String?
    let round: String?
    let lap: String?
    let races: [RaceAnd<T>]
    
    enum CodingKeys: String, CodingKey {
        case season
        case round
        case lap
        case races = "Races"
    }
}

struct Race: Decodable {
    let season: String
    let round: String
    let url: String
    let raceName: String
    let circuit: Circuit
    let date: String
    let time: String?
    let FirstPractice: Event?
    let SecondPractice: Event?
    let ThirdPractice: Event?
    let Qualifying: Event?
    let Sprint: Event?
    let SprintQualifying: Event?
}

struct RaceAnd<T: RaceAdditionalData>: Decodable {
    let season: String
    let round: String
    let url: String
    let raceName: String
    let circuit: Circuit
    let date: String
    let time: String?
    let additionalData: [T]?
    
    struct CodingKeys: CodingKey {
        let stringValue: String
        let intValue: Int? = nil
        
        init?(intValue: Int) {
            return nil
        }
        
        init(stringValue: String) {
            self.stringValue = stringValue
        }
        
        static var additionalData: Self { Self(stringValue: T.dataKey) }
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.season = try container.decode(String.self, forKey: CodingKeys(stringValue: "season"))
        self.round = try container.decode(String.self, forKey: CodingKeys(stringValue: "round"))
        self.url = try container.decode(String.self, forKey: CodingKeys(stringValue: "url"))
        self.raceName = try container.decode(String.self, forKey: CodingKeys(stringValue: "raceName"))
        self.circuit = try container.decode(Circuit.self, forKey: CodingKeys(stringValue: "circuit"))
        self.date = try container.decode(String.self, forKey: CodingKeys(stringValue: "date"))
        self.time = try container.decode(String.self, forKey: CodingKeys(stringValue: "time"))
        self.additionalData = try container.decode([T].self, forKey: CodingKeys.additionalData)
    }
}

protocol RaceAdditionalData: Decodable {
    static var dataKey: String { get }
}

struct FastestLap: Decodable {
    let rank: String
    let lap: String
    let time: Time
    let averageSpeed: AverageSpeed
    
    enum CodingKeys: String, CodingKey {
        case rank
        case lap
        case time = "Time"
        case averageSpeed = "AverageSpeed"
    }
    
    struct AverageSpeed: Decodable {
        let units: String
        let speed: String
    }
}
