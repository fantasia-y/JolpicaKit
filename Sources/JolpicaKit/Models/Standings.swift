//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

public struct StandingsTable<T: Standing>: ResultData {
    public static var resultKey: String { "StandingsTable" }
    
    public let season: String
    public let round: String
    public let standings: [Standings<T>]
    
    enum CodingKeys: String, CodingKey {
        case season
        case round
        case standings = "StandingsLists"
    }
    
    public init(season: String, round: String, standings: [Standings<T>]) {
        self.season = season
        self.round = round
        self.standings = standings
    }
}

public struct Standings<T: Standing>: Decodable, Sendable, Hashable {
    public let season: String
    public let round: String
    public let standings: [T]
    
    struct CodingKeys: CodingKey {
        let stringValue: String
        let intValue: Int? = nil
        
        init?(intValue: Int) {
            return nil
        }
        
        init(stringValue: String) {
            self.stringValue = stringValue
        }
        
        static var standings: Self { Self(stringValue: T.standingKey) }
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.season = try container.decode(String.self, forKey: CodingKeys(stringValue: "season"))
        self.round = try container.decode(String.self, forKey: CodingKeys(stringValue: "round"))
        self.standings = try container.decode([T].self, forKey: CodingKeys.standings)
    }
    
    public init(season: String, round: String, standings: [T]) {
        self.season = season
        self.round = round
        self.standings = standings
    }
}

public protocol Standing: Decodable, Sendable, Hashable {
    static var standingKey: String { get }
}

public struct ConstructorStanding: Standing {
    public static var standingKey: String { "ConstructorStandings" }
    
    public let position: String?
    public let positionText: String
    public let points: String
    public let wins: String
    public let constructor: Constructor
    
    enum CodingKeys: String, CodingKey {
        case position
        case positionText
        case points
        case wins
        case constructor = "Constructor"
    }
    
    public init(position: String?, positionText: String, points: String, wins: String, constructor: Constructor) {
        self.position = position
        self.positionText = positionText
        self.points = points
        self.wins = wins
        self.constructor = constructor
    }
}

public struct DriverStanding: Standing {
    public static var standingKey: String { "DriverStandings" }
    
    public let position: String?
    public let positionText: String
    public let points: String
    public let wins: String
    public let driver: Driver
    public let constructors: [Constructor]
    
    enum CodingKeys: String, CodingKey {
        case position
        case positionText
        case points
        case wins
        case driver = "Driver"
        case constructors = "Constructors"
    }
    
    public init(position: String?, positionText: String, points: String, wins: String, driver: Driver, constructors: [Constructor]) {
        self.position = position
        self.positionText = positionText
        self.points = points
        self.wins = wins
        self.driver = driver
        self.constructors = constructors
    }
}
