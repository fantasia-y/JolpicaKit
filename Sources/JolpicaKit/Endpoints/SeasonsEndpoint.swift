//
//  Seasons.swift
//  JolpicaKit
//
//  Created by Gordon on 06.02.2025.
//

import Foundation

class SeasonsEndpoint: JolpicaEndpoint, @unchecked Sendable {
    /// Returns a list of seasons from earliest to latest.
    ///
    /// - Parameters:
    ///     - season: Filters for a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    public func getSeasons(season: String?) async -> Result<MRData<SeasonTable>> {
        return await execute(JolpicaRequest(
            endpoint: .seasons,
            season: season
        ))
    }
    
    /// Filters for only seasons featuring a specified circuit.
    ///
    /// - Parameters:
    ///     - season: Filters for a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - circuitId: Filters for only seasons featuring a specified circuit.
    public func getSeasons(season: String?, circuitId: String) async -> Result<MRData<SeasonTable>> {
        return await execute(JolpicaRequest(
            endpoint: .circuits,
            season: season,
            filters: [circuitId, Endpoint.seasons.rawValue]
        ))
    }
    
    /// Filters for only seasons featuring a specified constructor.
    ///
    /// - Parameters:
    ///     - season: Filters for a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - constructorId: Filters for only seasons featuring a specified constructor.
    public func getSeasons(season: String?, constructorId: String) async -> Result<MRData<SeasonTable>> {
        return await execute(JolpicaRequest(
            endpoint: .constructors,
            season: season,
            filters: [constructorId, Endpoint.seasons.rawValue]
        ))
    }
    
    /// Filters for only seasons featuring a specified driver.
    ///
    /// - Parameters:
    ///     - season: Filters for a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - driverId: Filters for only seasons featuring a specified driver.
    public func getSeasons(season: String?, driverId: String) async -> Result<MRData<SeasonTable>> {
        return await execute(JolpicaRequest(
            endpoint: .drivers,
            season: season,
            filters: [driverId, Endpoint.seasons.rawValue]
        ))
    }
    
    /// Filters for only seasons featuring a specified grid position.
    ///
    /// - Parameters:
    ///     - season: Filters for a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - gridPosition: Filters for only seasons featuring a specified grid position.
    public func getSeasons(season: String?, gridPosition: String) async -> Result<MRData<SeasonTable>> {
        return await execute(JolpicaRequest(
            endpoint: .grid,
            season: season,
            filters: [gridPosition, Endpoint.seasons.rawValue]
        ))
    }
    
    /// Filters for only seasons featuring a specified finishing status of a driver in at least one race that season.
    ///
    /// - Parameters:
    ///     - season: Filters for a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race results for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - statusId: Filters for only seasons featuring a specified finishing status of a driver in at least one race that season.
    public func getSeasons(season: String?, statusId: String) async -> Result<MRData<SeasonTable>> {
        return await execute(JolpicaRequest(
            endpoint: .status,
            season: season,
            filters: [statusId, Endpoint.seasons.rawValue]
        ))
    }
}
