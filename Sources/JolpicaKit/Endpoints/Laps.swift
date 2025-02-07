//
//  Laps.swift
//  JolpicaKit
//
//  Created by Gordon on 07.02.2025.
//

import Foundation

struct Lap: RaceAdditionalData {
    static var dataKey: String { "Laps" }
    
    let number: String
    let timings: Timing
    
    enum CodingKeys: String, CodingKey {
        case number
        case timings = "Timings"
    }
}

extension Jolpica {
    public func getLaps(season: String, round: String) async -> Result<MRData<RaceTableAnd<Lap>>> {
        let request = formRequest(season: season, round: round, endpoint: "laps", filters: [])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<Lap>>.self)
    }
    
    public func getLaps(season: String, round: String, lapNumber: String) async -> Result<MRData<RaceTableAnd<Lap>>> {
        let request = formRequest(season: season, round: round, endpoint: "laps", filters: [lapNumber])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<Lap>>.self)
    }
    
    public func getLaps(season: String, round: String, driverId: String) async -> Result<MRData<RaceTableAnd<Lap>>> {
        let request = formRequest(season: season, round: round, endpoint: "drivers", filters: [driverId, "laps"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<Lap>>.self)
    }
    
    public func getLaps(season: String, round: String, constructorId: String) async -> Result<MRData<RaceTableAnd<Lap>>> {
        let request = formRequest(season: season, round: round, endpoint: "constructors", filters: [constructorId, "laps"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<Lap>>.self)
    }
}
