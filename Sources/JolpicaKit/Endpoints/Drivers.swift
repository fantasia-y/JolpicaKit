//
//  Drivers.swift
//  JolpicaKit
//
//  Created by Gordon on 05.02.2025.
//

import Foundation

class DriversEndpoint: JolpicaEndpoint, @unchecked Sendable {
    /// Returns a list of drivers in alphabetical order by driverId
    ///
    /// - Parameters:
    ///     - season: Filters only drivers that participated in a specified season. Year numbers are valid as is current to get the current season list of drivers.
    ///     - round: Filters only drivers that participated in a specified round of a specific season. Round numbers 1 -> n races are valid as well as last.
    public func getDrivers(season: String?, round: String?) async -> Result<MRData<DriverTable>> {
        return await execute(JolpicaRequest(
            endpoint: .drivers,
            season: season,
            round: round
        ))
    }
    
    /// Filters for only drivers who have participated in a race at a given circuit.
    ///
    /// - Parameters:
    ///     - season: Filters only drivers that participated in a specified season. Year numbers are valid as is current to get the current season list of drivers.
    ///     - round: Filters only drivers that participated in a specified round of a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - circuitId: Filters for only drivers who have participated in a race at a given circuit.
    public func getDrivers(season: String?, round: String?, circuitId: String) async -> Result<MRData<DriverTable>> {
        return await execute(JolpicaRequest(
            endpoint: .circuits,
            season: season,
            round: round,
            filters: [circuitId, Endpoint.drivers.rawValue]
        ))
    }
    
    /// Filters for only drivers who have raced for a specified constructor.
    ///
    /// - Parameters:
    ///     - season: Filters only drivers that participated in a specified season. Year numbers are valid as is current to get the current season list of drivers.
    ///     - round: Filters only drivers that participated in a specified round of a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - constructorId: Filters for only drivers who have raced for a specified constructor.
    public func getDrivers(season: String?, round: String?, constructorId: String) async -> Result<MRData<DriverTable>> {
        return await execute(JolpicaRequest(
            endpoint: .constructors,
            season: season,
            round: round,
            filters: [constructorId, Endpoint.drivers.rawValue]
        ))
    }
    
    /// Filters for only drivers that match the specific driverId.
    ///
    /// - Parameters:
    ///     - season: Filters only drivers that participated in a specified season. Year numbers are valid as is current to get the current season list of drivers.
    ///     - round: Filters only drivers that participated in a specified round of a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - driverId: Filters for only drivers that match the specific driverId.
    public func getDrivers(season: String?, round: String?, driverId: String) async -> Result<MRData<DriverTable>> {
        return await execute(JolpicaRequest(
            endpoint: .drivers,
            season: season,
            round: round,
            filters: [driverId]
        ))
    }
    
    /// Filters for only drivers that finished a race with a lap that was the ranked in the specified position.
    ///
    /// - Parameters:
    ///     - season: Filters only drivers that participated in a specified season. Year numbers are valid as is current to get the current season list of drivers.
    ///     - round: Filters only drivers that participated in a specified round of a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - lapRank: Filters for only drivers that finished a race with a lap that was the ranked in the specified position.
    public func getDrivers(season: String?, round: String?, lapRank: String) async -> Result<MRData<DriverTable>> {
        return await execute(JolpicaRequest(
            endpoint: .fastest,
            season: season,
            round: round,
            filters: [lapRank, Endpoint.drivers.rawValue]
        ))
    }
    
    /// Filters for only drivers who have started a race in a specific grid position.
    ///
    /// - Parameters:
    ///     - season: Filters only drivers that participated in a specified season. Year numbers are valid as is current to get the current season list of drivers.
    ///     - round: Filters only drivers that participated in a specified round of a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - gridPosition: Filters for only drivers who have started a race in a specific grid position.
    public func getDrivers(season: String?, round: String?, gridPosition: String) async -> Result<MRData<DriverTable>> {
        return await execute(JolpicaRequest(
            endpoint: .grid,
            season: season,
            round: round,
            filters: [gridPosition, Endpoint.drivers.rawValue]
        ))
    }
    
    /// Filters for only drivers who have finished a race in a specific position.
    ///
    /// - Parameters:
    ///     - season: Filters only drivers that participated in a specified season. Year numbers are valid as is current to get the current season list of drivers.
    ///     - round: Filters only drivers that participated in a specified round of a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - finishPosition: Filters for only drivers who have finished a race in a specific position.
    public func getDrivers(season: String?, round: String?, finishPosition: String) async -> Result<MRData<DriverTable>> {
        return await execute(JolpicaRequest(
            endpoint: .results,
            season: season,
            round: round,
            filters: [finishPosition, Endpoint.drivers.rawValue]
        ))
    }
    
    /// Filters for only drivers who have finished a race with a specific statusId.
    ///
    /// - Parameters:
    ///     - season: Filters only drivers that participated in a specified season. Year numbers are valid as is current to get the current season list of drivers.
    ///     - round: Filters only drivers that participated in a specified round of a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - statusId: Filters for only drivers who have finished a race with a specific statusId.
    public func getDrivers(season: String?, round: String?, statusId: String) async -> Result<MRData<DriverTable>> {
        return await execute(JolpicaRequest(
            endpoint: .status,
            season: season,
            round: round,
            filters: [statusId, Endpoint.drivers.rawValue]
        ))
    }
}
