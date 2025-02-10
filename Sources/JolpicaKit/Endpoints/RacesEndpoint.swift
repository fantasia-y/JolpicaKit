//
//  Races.swift
//  JolpicaKit
//
//  Created by Gordon on 06.02.2025.
//

import Foundation

class RacesEndpoint: JolpicaEndpoint, @unchecked Sendable {
    /// Returns a list of races from earliest to latest.
    ///
    /// - Parameters:
    ///     - season: Filters for races only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last and next.
    public func getRaces(season: String?, round: String?) async -> Result<MRData<RaceTable>> {
        return await execute(JolpicaRequest(
            endpoint: .races,
            season: season,
            round: round
        ))
    }
    
    /// Filters for only races featuring a specified circuit.
    ///
    /// - Parameters:
    ///     - season: Filters for races only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last and next.
    ///     - circuitId: Filters for only races featuring a specified circuit.
    public func getRaces(season: String?, round: String?, circuitId: String) async -> Result<MRData<RaceTable>> {
        return await execute(JolpicaRequest(
            endpoint: .circuits,
            season: season,
            round: round,
            filters: [circuitId, Endpoint.races.rawValue]
        ))
    }
    
    /// Filters for only races featuring a specified constructor.
    ///
    /// - Parameters:
    ///     - season: Filters for races only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last and next.
    ///     - constructorId: Filters for only races featuring a specified constructor.
    public func getRaces(season: String?, round: String?, constructorId: String) async -> Result<MRData<RaceTable>> {
        return await execute(JolpicaRequest(
            endpoint: .constructors,
            season: season,
            round: round,
            filters: [constructorId, Endpoint.races.rawValue]
        ))
    }
    
    /// Filters for only races featuring a specified driver.
    ///
    /// - Parameters:
    ///     - season: Filters for races only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last and next.
    ///     - driverId: Filters for only races featuring a specified driver.
    public func getRaces(season: String?, round: String?, driverId: String) async -> Result<MRData<RaceTable>> {
        return await execute(JolpicaRequest(
            endpoint: .drivers,
            season: season,
            round: round,
            filters: [driverId, Endpoint.races.rawValue]
        ))
    }
    
    /// Filters for only races featuring a specified grid position.
    ///
    /// - Parameters:
    ///     - season: Filters for races only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last and next.
    ///     - gridPosition: Filters for only races featuring a specified grid position.
    public func getRaces(season: String?, round: String?, gridPosition: String) async -> Result<MRData<RaceTable>> {
        return await execute(JolpicaRequest(
            endpoint: .grid,
            season: season,
            round: round,
            filters: [gridPosition, Endpoint.races.rawValue]
        ))
    }
    
    /// Filters for only races featuring a specified finishing status of a driver.
    ///
    /// - Parameters:
    ///     - season: Filters for races only from a specified season. Year numbers are valid as is current to get the current season.
    ///     - round: Filters for the race for a specified round in a specific season. Round numbers 1 -> n races are valid as well as last and next.
    ///     - statusId: Filters for only races featuring a specified finishing status of a driver.
    public func getRaces(season: String?, round: String?, statusId: String) async -> Result<MRData<RaceTable>> {
        return await execute(JolpicaRequest(
            endpoint: .status,
            season: season,
            round: round,
            filters: [statusId, Endpoint.races.rawValue]
        ))
    }
}
