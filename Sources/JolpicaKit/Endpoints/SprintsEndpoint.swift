//
//  Sprints.swift
//  JolpicaKit
//
//  Created by Gordon on 07.02.2025.
//

import Foundation

class SprintsEndpoint: JolpicaEndpoint, @unchecked Sendable {
    public func getSprints(season: String?, round: String?) async -> Result<MRData<RaceTableAnd<Sprint>>> {
        return await execute(JolpicaRequest(
            endpoint: .sprints,
            season: season,
            round: round
        ))
    }
    
    public func getSprints(season: String?, round: String?, circuitId: String) async -> Result<MRData<RaceTableAnd<Sprint>>> {
        return await execute(JolpicaRequest(
            endpoint: .circuits,
            season: season,
            round: round,
            filters: [circuitId, Endpoint.sprints.rawValue]
        ))
    }
    
    public func getSprints(season: String?, round: String?, constructorId: String) async -> Result<MRData<RaceTableAnd<Sprint>>> {
        return await execute(JolpicaRequest(
            endpoint: .constructors,
            season: season,
            round: round,
            filters: [constructorId, Endpoint.sprints.rawValue]
        ))
    }
    
    public func getSprints(season: String?, round: String?, driverId: String) async -> Result<MRData<RaceTableAnd<Sprint>>> {
        return await execute(JolpicaRequest(
            endpoint: .drivers,
            season: season,
            round: round,
            filters: [driverId, Endpoint.sprints.rawValue]
        ))
    }
    
    public func getSprints(season: String?, round: String?, gridPosition: String) async -> Result<MRData<RaceTableAnd<Sprint>>> {
        return await execute(JolpicaRequest(
            endpoint: .grid,
            season: season,
            round: round,
            filters: [gridPosition, Endpoint.sprints.rawValue]
        ))
    }
    
    public func getSprints(season: String?, round: String?, statusId: String) async -> Result<MRData<RaceTableAnd<Sprint>>> {
        return await execute(JolpicaRequest(
            endpoint: .status,
            season: season,
            round: round,
            filters: [statusId, Endpoint.sprints.rawValue]
        ))
    }
}
