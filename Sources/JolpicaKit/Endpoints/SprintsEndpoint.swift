//
//  Sprints.swift
//  JolpicaKit
//
//  Created by Gordon on 07.02.2025.
//

import Foundation

public class SprintsEndpoint: JolpicaEndpoint, @unchecked Sendable {
    public func getSprints(season: String? = nil, round: String? = nil, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<Sprint>>> {
        return await execute(JolpicaRequest(
            endpoint: .sprints,
            season: season,
            round: round,
            offset: offset,
            limit: limit
        ))
    }
    
    public func getSprints(season: String? = nil, round: String? = nil, circuitId: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<Sprint>>> {
        return await execute(JolpicaRequest(
            endpoint: .circuits,
            season: season,
            round: round,
            filters: [circuitId, Endpoint.sprints.rawValue],
            offset: offset,
            limit: limit
        ))
    }
    
    public func getSprints(season: String? = nil, round: String? = nil, constructorId: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<Sprint>>> {
        return await execute(JolpicaRequest(
            endpoint: .constructors,
            season: season,
            round: round,
            filters: [constructorId, Endpoint.sprints.rawValue],
            offset: offset,
            limit: limit
        ))
    }
    
    public func getSprints(season: String? = nil, round: String? = nil, driverId: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<Sprint>>> {
        return await execute(JolpicaRequest(
            endpoint: .drivers,
            season: season,
            round: round,
            filters: [driverId, Endpoint.sprints.rawValue],
            offset: offset,
            limit: limit
        ))
    }
    
    public func getSprints(season: String? = nil, round: String? = nil, gridPosition: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<Sprint>>> {
        return await execute(JolpicaRequest(
            endpoint: .grid,
            season: season,
            round: round,
            filters: [gridPosition, Endpoint.sprints.rawValue],
            offset: offset,
            limit: limit
        ))
    }
    
    public func getSprints(season: String? = nil, round: String? = nil, statusId: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<Sprint>>> {
        return await execute(JolpicaRequest(
            endpoint: .status,
            season: season,
            round: round,
            filters: [statusId, Endpoint.sprints.rawValue],
            offset: offset,
            limit: limit
        ))
    }
}
