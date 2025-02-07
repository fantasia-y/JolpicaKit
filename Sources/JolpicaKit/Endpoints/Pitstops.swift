//
//  Pitstops.swift
//  JolpicaKit
//
//  Created by Gordon on 07.02.2025.
//

import Foundation

struct Pitstop: RaceAdditionalData {
    static var dataKey: String { "PitStops" }
    
    let driverId: String
    let lap: String?
    let stop: String?
    let time: String?
    let duration: String?
}

extension Jolpica {
    public func getPitstops(season: String, round: String) async -> Result<MRData<RaceTableAnd<Pitstop>>> {
        let request = formRequest(season: season, round: round, endpoint: "pitstops", filters: [])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<Pitstop>>.self)
    }
    
    public func getPitstops(season: String, round: String, stopNumber: String) async -> Result<MRData<RaceTableAnd<Pitstop>>> {
        let request = formRequest(season: season, round: round, endpoint: "pitstops", filters: [stopNumber])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<Pitstop>>.self)
    }
    
    public func getPitstops(season: String, round: String, driverId: String) async -> Result<MRData<RaceTableAnd<Pitstop>>> {
        let request = formRequest(season: season, round: round, endpoint: "drivers", filters: [driverId, "pitstops"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<Pitstop>>.self)
    }
    
    public func getPitstops(season: String, round: String, lapNumber: String) async -> Result<MRData<RaceTableAnd<Pitstop>>> {
        let request = formRequest(season: season, round: round, endpoint: "laps", filters: [lapNumber, "pitstops"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<Pitstop>>.self)
    }
}
