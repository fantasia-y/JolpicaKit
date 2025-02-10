//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

struct StandingsTable<T: Standing>: ResultData {
    static var resultKey: String { "StandingsTable" }
    
    let season: String
    let round: String
    let standings: [Standings<T>]
    
    enum CodingKeys: String, CodingKey {
        case season
        case round
        case standings = "StandingsLists"
    }
}

struct Standings<T: Standing>: Decodable {
    let season: String
    let round: String
    let standings: [T]
    
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
}

protocol Standing: Decodable {
    static var standingKey: String { get }
}

struct ConstructorStanding: Standing {
    static var standingKey: String { "ConstructorStandings" }
    
    let position: String?
    let positionText: String
    let points: String
    let wins: String
    let constructor: Constructor
    
    enum CodingKeys: String, CodingKey {
        case position
        case positionText
        case points
        case wins
        case constructor = "Constructor"
    }
}

struct DriverStanding: Standing {
    static var standingKey: String { "DriverStandings" }
    
    let position: String?
    let positionText: String
    let points: String
    let wins: String
    let driver: Driver
    let constructors: [Constructor]
    
    enum CodingKeys: String, CodingKey {
        case position
        case positionText
        case points
        case wins
        case driver = "Driver"
        case constructors = "Constructors"
    }
}
