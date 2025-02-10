//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

public struct RaceTable: ResultData {
    public static var resultKey: String { "RaceTable" }
    
    public let season: String?
    public let round: String?
    public let lap: String?
    public let races: [Race]
    
    enum CodingKeys: String, CodingKey {
        case season
        case round
        case lap
        case races = "Races"
    }
}

public struct RaceTableAnd<T: RaceAdditionalData>: ResultData {
    public static var resultKey: String { "RaceTable" }
    
    public let season: String?
    public let round: String?
    public let lap: String?
    public let races: [RaceAnd<T>]
    
    enum CodingKeys: String, CodingKey {
        case season
        case round
        case lap
        case races = "Races"
    }
}

public struct Race: Decodable {
    public let season: String
    public let round: String
    public let url: String
    public let raceName: String
    public let circuit: Circuit
    public let date: String
    public let time: String?
    public let firstPractice: Event?
    public let secondPractice: Event?
    public let thirdPractice: Event?
    public let qualifying: Event?
    public let sprint: Event?
    public let sprintQualifying: Event?
    
    enum CodingKeys: String, CodingKey {
        case season
        case round
        case url
        case raceName
        case circuit = "Circuit"
        case date
        case time
        case firstPractice = "FirstPractice"
        case secondPractice = "SecondPractice"
        case thirdPractice = "ThirdPractice"
        case qualifying = "Qualifying"
        case sprint = "Sprint"
        case sprintQualifying = "SprintQualifying"
    }
}

public struct RaceAnd<T: RaceAdditionalData>: Decodable {
    public let season: String
    public let round: String
    public let url: String
    public let raceName: String
    public let circuit: Circuit
    public let date: String
    public let time: String?
    public let additionalData: [T]?
    
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
        self.circuit = try container.decode(Circuit.self, forKey: CodingKeys(stringValue: "Circuit"))
        self.date = try container.decode(String.self, forKey: CodingKeys(stringValue: "date"))
        self.time = try container.decode(String.self, forKey: CodingKeys(stringValue: "time"))
        self.additionalData = try container.decode([T].self, forKey: CodingKeys.additionalData)
    }
}

public protocol RaceAdditionalData: Decodable {
    static var dataKey: String { get }
}

public struct FastestLap: Decodable {
    public let rank: String
    public let lap: String
    public let time: Time
    public let averageSpeed: AverageSpeed
    
    enum CodingKeys: String, CodingKey {
        case rank
        case lap
        case time = "Time"
        case averageSpeed = "AverageSpeed"
    }
    
    public struct AverageSpeed: Decodable {
        public let units: String
        public let speed: String
    }
}
