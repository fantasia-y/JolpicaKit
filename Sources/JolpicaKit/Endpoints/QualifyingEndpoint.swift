//
//  Qualifyings.swift
//  JolpicaKit
//
//  Created by Gordon on 07.02.2025.
//

import Foundation

public class QualifyingsEndpoint: JolpicaEndpoint, @unchecked Sendable {
    /// Returns a list of qualification results from each race.
    ///
    /// - Parameters:
    ///     - season: Filters for qualifying results only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the qualifying results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last and next.
    public func getQualifyings(season: String? = nil, round: String? = nil, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<QualifyingResults>>> {
        return await execute(JolpicaRequest(
            endpoint: .qualifying,
            season: season,
            round: round,
            offset: offset,
            limit: limit
        ))
    }
    
    /// Filters for the qualifying results at a specified circuit.
    ///
    /// - Parameters:
    ///     - season: Filters for qualifying results only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the qualifying results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last and next.
    ///     - circuitId: Filters for the qualifying results at a specified circuit.
    public func getQualifyings(season: String? = nil, round: String? = nil, circuitId: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<QualifyingResults>>> {
        return await execute(JolpicaRequest(
            endpoint: .circuits,
            season: season,
            round: round,
            filters: [circuitId, Endpoint.qualifying.rawValue],
            offset: offset,
            limit: limit
        ))
    }
    
    /// Filters for the qualifying results of drivers driving for a specified constructor.
    ///
    /// - Parameters:
    ///     - season: Filters for qualifying results only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the qualifying results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last and next.
    ///     - constructorId: Filters for the qualifying results of drivers driving for a specified constructor.
    public func getQualifyings(season: String? = nil, round: String? = nil, constructorId: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<QualifyingResults>>> {
        return await execute(JolpicaRequest(
            endpoint: .constructors,
            season: season,
            round: round,
            filters: [constructorId, Endpoint.qualifying.rawValue],
            offset: offset,
            limit: limit
        ))
    }
    
    /// Filters for the qualifying results of a specified driver.
    ///
    /// - Parameters:
    ///     - season: Filters for qualifying results only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the qualifying results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last and next.
    ///     - driverId: Filters for the qualifying results of a specified driver.
    public func getQualifyings(season: String? = nil, round: String? = nil, driverId: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<QualifyingResults>>> {
        return await execute(JolpicaRequest(
            endpoint: .drivers,
            season: season,
            round: round,
            filters: [driverId, Endpoint.qualifying.rawValue],
            offset: offset,
            limit: limit
        ))
    }
    
    /// Filters for the qualifying results of a driver who started the associated race in a specified grid position.
    ///
    /// - Parameters:
    ///     - season: Filters for qualifying results only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the qualifying results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last and next.
    ///     - gridPosition: Filters for the qualifying results of a driver who started the associated race in a specified grid position.
    public func getQualifyings(season: String? = nil, round: String? = nil, gridPosition: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<QualifyingResults>>> {
        return await execute(JolpicaRequest(
            endpoint: .grid,
            season: season,
            round: round,
            filters: [gridPosition, Endpoint.qualifying.rawValue],
            offset: offset,
            limit: limit
        ))
    }
    
    /// Filters for the qualifying results a driver with the fastest lap rank at a given Grand Prix.
    ///
    /// - Parameters:
    ///     - season: Filters for qualifying results only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the qualifying results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last and next.
    ///     - lapRank: Filters for the qualifying results a driver with the fastest lap rank at a given Grand Prix.
    public func getQualifyings(season: String? = nil, round: String? = nil, lapRank: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<QualifyingResults>>> {
        return await execute(JolpicaRequest(
            endpoint: .fastest,
            season: season,
            round: round,
            filters: [lapRank, Endpoint.qualifying.rawValue],
            offset: offset,
            limit: limit
        ))
    }
    
    /// Filters for the qualifying results of any drivers with the finishing statusId at a given Grand Prix.
    ///
    /// - Parameters:
    ///     - season: Filters for qualifying results only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the qualifying results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last and next.
    ///     - statusId: Filters for the qualifying results of any drivers with the finishing statusId at a given Grand Prix.
    public func getQualifyings(season: String? = nil, round: String? = nil, statusId: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<QualifyingResults>>> {
        return await execute(JolpicaRequest(
            endpoint: .status,
            season: season,
            round: round,
            filters: [statusId, Endpoint.qualifying.rawValue],
            offset: offset,
            limit: limit
        ))
    }
}
