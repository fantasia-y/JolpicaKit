//
//  Sprints.swift
//  JolpicaKit
//
//  Created by Gordon on 07.02.2025.
//

import Foundation

struct Sprint: RaceAdditionalData {
    static var dataKey: String { "SprintResults" }
    
    let number: String
    let position: String
    let positionText: String
    let points: String
    let driver: Driver
    let constructor: Constructor?
    let grid: String?
    let laps: String?
    let status: String?
    let time: Time?
    let fastestLap: FastestLap?
}

extension Jolpica {
    public func getSprints(season: String?, round: String?) async -> Result<MRData<RaceTableAnd<Sprint>>> {
        let request = formRequest(season: season, round: round, endpoint: "races", filters: [])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<Sprint>>.self)
    }
    
    public func getSprints(season: String?, round: String?, circuitId: String) async -> Result<MRData<RaceTableAnd<Sprint>>> {
        let request = formRequest(season: season, round: round, endpoint: "circuits", filters: [circuitId, "sprint"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<Sprint>>.self)
    }
    
    public func getSprints(season: String?, round: String?, constructorId: String) async -> Result<MRData<RaceTableAnd<Sprint>>> {
        let request = formRequest(season: season, round: round, endpoint: "constructors", filters: [constructorId, "sprint"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<Sprint>>.self)
    }
    
    public func getSprints(season: String?, round: String?, driverId: String) async -> Result<MRData<RaceTableAnd<Sprint>>> {
        let request = formRequest(season: season, round: round, endpoint: "drivers", filters: [driverId, "sprint"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<Sprint>>.self)
    }
    
    public func getSprints(season: String?, round: String?, gridPosition: String) async -> Result<MRData<RaceTableAnd<Sprint>>> {
        let request = formRequest(season: season, round: round, endpoint: "grid", filters: [gridPosition, "sprint"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<Sprint>>.self)
    }
    
    public func getSprints(season: String?, round: String?, statusId: String) async -> Result<MRData<RaceTableAnd<Sprint>>> {
        let request = formRequest(season: season, round: round, endpoint: "status", filters: [statusId, "sprint"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<Sprint>>.self)
    }
}
