//
//  Results.swift
//  JolpicaKit
//
//  Created by Gordon on 07.02.2025.
//

import Foundation

public class ResultsEndpoint: JolpicaEndpoint, @unchecked Sendable {
    /// Returns a list of race results.
    ///
    /// - Parameters:
    ///     - season: Filters for race results only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    public func getResults(season: String? = nil, round: String? = nil, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<RaceResult>>> {
        return await execute(JolpicaRequest(
            endpoint: .results,
            season: season,
            round: round,
            offset: offset,
            limit: limit
        ))
    }
    
    /// Filters for only race results from races at a specified circuit.
    ///
    /// - Parameters:
    ///     - season: Filters for race results only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - circuitId: Filters for only race results from races at a specified circuit.
    public func getResults(season: String? = nil, round: String? = nil, circuitId: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<RaceResult>>> {
        return await execute(JolpicaRequest(
            endpoint: .circuits,
            season: season,
            round: round,
            filters: [circuitId, Endpoint.results.rawValue],
            offset: offset,
            limit: limit
        ))
    }
    
    /// Filters for only race results for drivers racings for a specified constructor.
    ///
    /// - Parameters:
    ///     - season: Filters for race results only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - constructorId: Filters for only race results for drivers racings for a specified constructor.
    public func getResults(season: String? = nil, round: String? = nil, constructorId: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<RaceResult>>> {
        return await execute(JolpicaRequest(
            endpoint: .constructors,
            season: season,
            round: round,
            filters: [constructorId, Endpoint.results.rawValue],
            offset: offset,
            limit: limit
        ))
    }
    
    /// Filters for only race results for a specified driver.
    ///
    /// - Parameters:
    ///     - season: Filters for race results only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - driverId: Filters for only race results for a specified driver.
    public func getResults(season: String? = nil, round: String? = nil, driverId: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<RaceResult>>> {
        return await execute(JolpicaRequest(
            endpoint: .drivers,
            season: season,
            round: round,
            filters: [driverId, Endpoint.results.rawValue],
            offset: offset,
            limit: limit
        ))
    }
    
    /// Filters for only race results of the driver who had the nth fastest lap of the race.
    ///
    /// - Parameters:
    ///     - season: Filters for race results only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - lapRank: Filters for only race results of the driver who had the nth fastest lap of the race.
    public func getResults(season: String? = nil, round: String? = nil, lapRank: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<RaceResult>>> {
        return await execute(JolpicaRequest(
            endpoint: .fastest,
            season: season,
            round: round,
            filters: [lapRank, Endpoint.results.rawValue],
            offset: offset,
            limit: limit
        ))
    }
    
    /// Filters for only race results for drivers starting in a specified grid position.
    ///
    /// - Parameters:
    ///     - season: Filters for race results only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - gridPosition: Filters for only race results for drivers starting in a specified grid position.
    public func getResults(season: String? = nil, round: String? = nil, gridPosition: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<RaceResult>>> {
        return await execute(JolpicaRequest(
            endpoint: .grid,
            season: season,
            round: round,
            filters: [gridPosition, Endpoint.results.rawValue],
            offset: offset,
            limit: limit
        ))
    }
    
    /// Filters for only race results of a driver who finished the race with a specific status.
    ///
    /// - Parameters:
    ///     - season: Filters for race results only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - statusId: Filters for only race results of a driver who finished the race with a specific status.
    public func getResults(season: String? = nil, round: String? = nil, statusId: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<RaceResult>>> {
        return await execute(JolpicaRequest(
            endpoint: .status,
            season: season,
            round: round,
            filters: [statusId, Endpoint.results.rawValue],
            offset: offset,
            limit: limit
        ))
    }
}
