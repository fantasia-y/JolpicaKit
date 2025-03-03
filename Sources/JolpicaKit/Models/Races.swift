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
    
    public init(season: String?, round: String?, lap: String?, races: [Race]) {
        self.season = season
        self.round = round
        self.lap = lap
        self.races = races
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
    
    public init(season: String?, round: String?, lap: String?, races: [RaceAnd<T>]) {
        self.season = season
        self.round = round
        self.lap = lap
        self.races = races
    }
}

public struct Race: Decodable, Sendable, Hashable {
    public let season: String
    public let round: String
    public let url: String?
    public let raceName: String
    public let circuit: Circuit
    public let date: Date
    public let time: String?
    public let firstPractice: Event?
    public let secondPractice: Event?
    public let thirdPractice: Event?
    public let qualifying: Event?
    public let sprint: Event?
    public let sprintQualifying: Event?
    
    public init(season: String, round: String, url: String?, raceName: String, circuit: Circuit, date: Date, time: String?, firstPractice: Event?, secondPractice: Event?, thirdPractice: Event?, qualifying: Event?, sprint: Event?, sprintQualifying: Event?) {
        self.season = season
        self.round = round
        self.url = url
        self.raceName = raceName
        self.circuit = circuit
        self.date = date
        self.time = time
        self.firstPractice = firstPractice
        self.secondPractice = secondPractice
        self.thirdPractice = thirdPractice
        self.qualifying = qualifying
        self.sprint = sprint
        self.sprintQualifying = sprintQualifying
    }
    
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

public struct RaceAnd<T: RaceAdditionalData>: Decodable, Sendable, Hashable {
    public let season: String
    public let round: String
    public let url: String?
    public let raceName: String
    public let circuit: Circuit
    public let date: Date
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
        self.date = try container.decode(Date.self, forKey: CodingKeys(stringValue: "date"))
        self.time = try container.decode(String.self, forKey: CodingKeys(stringValue: "time"))
        self.additionalData = try container.decode([T].self, forKey: CodingKeys.additionalData)
    }
    
    public init(season: String, round: String, url: String?, raceName: String, circuit: Circuit, date: Date, time: String?, additionalData: [T]?) {
        self.season = season
        self.round = round
        self.url = url
        self.raceName = raceName
        self.circuit = circuit
        self.date = date
        self.time = time
        self.additionalData = additionalData
    }
}

public protocol RaceAdditionalData: Decodable, Sendable, Hashable {
    static var dataKey: String { get }
}

public struct FastestLap: Decodable, Sendable, Hashable {
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
    
    public struct AverageSpeed: Decodable, Sendable, Hashable {
        public let units: String
        public let speed: String
    }
    
    public init(rank: String, lap: String, time: Time, averageSpeed: AverageSpeed) {
        self.rank = rank
        self.lap = lap
        self.time = time
        self.averageSpeed = averageSpeed
    }
}
