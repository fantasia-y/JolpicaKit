//
//  Standings.swift
//  JolpicaKit
//
//  Created by Gordon on 05.02.2025.
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

extension Jolpica {
    public func getConstructorStandings(season: String, round: String?) async -> Result<MRData<StandingsTable<ConstructorStanding>>> {
        let request = formRequest(season: season, round: round, endpoint: "constructorstandings", filters: [])
        
        return await self.request(request: request, decode: MRData<StandingsTable<ConstructorStanding>>.self)
    }
    
    public func getConstructorStandings(season: String, round: String?, constructorId: String) async -> Result<MRData<StandingsTable<ConstructorStanding>>> {
        let request = formRequest(season: season, round: round, endpoint: "constructors", filters: [constructorId, "constructorstandings"])
        
        return await self.request(request: request, decode: MRData<StandingsTable<ConstructorStanding>>.self)
    }
    
    public func getConstructorStandings(season: String, round: String?, finishPosition: String) async -> Result<MRData<StandingsTable<ConstructorStanding>>> {
        let request = formRequest(season: season, round: round, endpoint: "constructorstandings", filters: [finishPosition])
        
        return await self.request(request: request, decode: MRData<StandingsTable<ConstructorStanding>>.self)
    }
}

extension Jolpica {
    public func getDriverStandings(season: String, round: String?) async -> Result<MRData<StandingsTable<ConstructorStanding>>> {
        let request = formRequest(season: season, round: round, endpoint: "driverstandings", filters: [])
        
        return await self.request(request: request, decode: MRData<StandingsTable<ConstructorStanding>>.self)
    }
    
    public func getDriverStandings(season: String, round: String?, driverId: String) async -> Result<MRData<StandingsTable<ConstructorStanding>>> {
        let request = formRequest(season: season, round: round, endpoint: "drivers", filters: [driverId, "driverstandings"])
        
        return await self.request(request: request, decode: MRData<StandingsTable<ConstructorStanding>>.self)
    }
    
    public func getDriverStandings(season: String, round: String?, finishPosition: String) async -> Result<MRData<StandingsTable<ConstructorStanding>>> {
        let request = formRequest(season: season, round: round, endpoint: "driverstandings", filters: [finishPosition])
        
        return await self.request(request: request, decode: MRData<StandingsTable<ConstructorStanding>>.self)
    }
}
