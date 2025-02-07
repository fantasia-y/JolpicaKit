//
//  Results.swift
//  JolpicaKit
//
//  Created by Gordon on 07.02.2025.
//

import Foundation

struct RaceResult: RaceAdditionalData {
    static var dataKey: String { "Results" }
    
    let number: String
    let position: String
    let positionText: String
    let points: String
    let driver: Driver
    let constructor: Constructor?
    let grid: String?
    let laps: String?
    let status: String?
    let fastestLap: FastestLap?
}

extension Jolpica {
    public func getResults(
        season: String?,
        round: String?,
        circuitId: String?,
        constructorId: String?,
        driverId: String?,
        lapRank: String?,
        gridPosition: String?
    ) -> MRData<RaceTableAnd<RaceResult>>? {
        return nil
    }
    
    public func getResults(season: String?, round: String?) async -> Result<MRData<RaceTableAnd<RaceResult>>> {
        let request = formRequest(season: season, round: round, endpoint: "qualifying", filters: [])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<RaceResult>>.self)
    }
    
    public func getResults(season: String?, round: String?, circuitId: String) async -> Result<MRData<RaceTableAnd<RaceResult>>> {
        let request = formRequest(season: season, round: round, endpoint: "circuits", filters: [circuitId, "results"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<RaceResult>>.self)
    }
    
    public func getResults(season: String?, round: String?, constructorId: String) async -> Result<MRData<RaceTableAnd<RaceResult>>> {
        let request = formRequest(season: season, round: round, endpoint: "constructors", filters: [constructorId, "results"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<RaceResult>>.self)
    }
    
    public func getResults(season: String?, round: String?, driverId: String) async -> Result<MRData<RaceTableAnd<RaceResult>>> {
        let request = formRequest(season: season, round: round, endpoint: "drivers", filters: [driverId, "results"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<RaceResult>>.self)
    }
    
    public func getResults(season: String?, round: String?, lapRank: String) async -> Result<MRData<RaceTableAnd<RaceResult>>> {
        let request = formRequest(season: season, round: round, endpoint: "fastest", filters: [lapRank, "results"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<RaceResult>>.self)
    }
    
    public func getResults(season: String?, round: String?, gridPosition: String) async -> Result<MRData<RaceTableAnd<RaceResult>>> {
        let request = formRequest(season: season, round: round, endpoint: "grid", filters: [gridPosition, "results"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<RaceResult>>.self)
    }
    
    public func getResults(season: String?, round: String?, statusId: String) async -> Result<MRData<RaceTableAnd<RaceResult>>> {
        let request = formRequest(season: season, round: round, endpoint: "status", filters: [statusId, "results"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<RaceResult>>.self)
    }
}
