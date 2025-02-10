//
//  Circuits.swift
//  JolpicaKit
//
//  Created by Gordon on 05.02.2025.
//

import Foundation

class CircuitsEndpoint: JolpicaEndpoint, @unchecked Sendable {
    /// Returns a list of circuits in alphabetical order by circuitId.
    ///
    /// - Parameters:
    ///     - season: Filters only circuits which hosted a race in a given season. Year numbers are valid as is current to get the current season's list of circuits.
    ///     - round: Filters only for the circuit that hosted the race in the specified round of the specific season. Round numbers 1 -> n races are valid as well as last and next.
    public func getCircuits(season: String?, round: String?) async -> Result<MRData<CircuitTable>> {
        return await execute(JolpicaRequest(
            endpoint: .circuits,
            season: season,
            round: round
        ))
    }
    
    /// Filters for only the circuit that matches the specified circuitId.
    ///
    /// - Parameters:
    ///     - season: Filters only circuits which hosted a race in a given season. Year numbers are valid as is current to get the current season's list of circuits.
    ///     - round: Filters only for the circuit that hosted the race in the specified round of the specific season. Round numbers 1 -> n races are valid as well as last and next.
    ///     - circuitId: Filters for only the circuit that matches the specified circuitId.
    public func getCircuits(season: String?, round: String?, circuitId: String) async -> Result<MRData<CircuitTable>> {
        return await execute(JolpicaRequest(
            endpoint: .circuits,
            season: season,
            round: round,
            filters: [circuitId]
        ))
    }
    
    /// Filters for only circuits that the specified constructor has participated in a race at.
    ///
    /// - Parameters:
    ///     - season: Filters only circuits which hosted a race in a given season. Year numbers are valid as is current to get the current season's list of circuits.
    ///     - round: Filters only for the circuit that hosted the race in the specified round of the specific season. Round numbers 1 -> n races are valid as well as last and next.
    ///     - constructorId: Filters for only circuits that the specified constructor has participated in a race at.
    public func getCircuits(season: String?, round: String?, constructorId: String) async -> Result<MRData<CircuitTable>> {
        return await execute(JolpicaRequest(
            endpoint: .constructors,
            season: season,
            round: round,
            filters: [constructorId, Endpoint.circuits.rawValue]
        ))
    }
    
    /// Filters for only circuits that the specified driver has participated in a race at.
    ///
    /// - Parameters:
    ///     - season: Filters only circuits which hosted a race in a given season. Year numbers are valid as is current to get the current season's list of circuits.
    ///     - round: Filters only for the circuit that hosted the race in the specified round of the specific season. Round numbers 1 -> n races are valid as well as last and next.
    ///     - driverId: Filters for only circuits that the specified driver has participated in a race at.
    public func getCircuits(season: String?, round: String?, driverId: String) async -> Result<MRData<CircuitTable>> {
        return await execute(JolpicaRequest(
            endpoint: .drivers,
            season: season,
            round: round,
            filters: [driverId, Endpoint.circuits.rawValue]
        ))
    }
    
    /// Filters for a list of circuits where a race finished with a driver completing a lap that was the ranked in the specified position.
    ///
    /// - Parameters:
    ///     - season: Filters only circuits which hosted a race in a given season. Year numbers are valid as is current to get the current season's list of circuits.
    ///     - round: Filters only for the circuit that hosted the race in the specified round of the specific season. Round numbers 1 -> n races are valid as well as last and next.
    ///     - lapRank: Filters for a list of circuits where a race finished with a driver completing a lap that was the ranked in the specified position.
    public func getCircuits(season: String?, round: String?, lapRank: String) async -> Result<MRData<CircuitTable>> {
        return await execute(JolpicaRequest(
            endpoint: .fastest,
            season: season,
            round: round,
            filters: [lapRank, Endpoint.circuits.rawValue]
        ))
    }
    
    /// Filters for only circuits that have had a race with a specific grid position.
    ///
    /// - Parameters:
    ///     - season: Filters only circuits which hosted a race in a given season. Year numbers are valid as is current to get the current season's list of circuits.
    ///     - round: Filters only for the circuit that hosted the race in the specified round of the specific season. Round numbers 1 -> n races are valid as well as last and next.
    ///     - gridPosition: Filters for only circuits that have had a race with a specific grid position.
    public func getCircuits(season: String?, round: String?, gridPosition: String) async -> Result<MRData<CircuitTable>> {
        return await execute(JolpicaRequest(
            endpoint: .grid,
            season: season,
            round: round,
            filters: [gridPosition, Endpoint.circuits.rawValue]
        ))
    }
    
    /// Filters for only circuits that have had a race where a specific finishing position was valid.
    ///
    /// - Parameters:
    ///     - season: Filters only circuits which hosted a race in a given season. Year numbers are valid as is current to get the current season's list of circuits.
    ///     - round: Filters only for the circuit that hosted the race in the specified round of the specific season. Round numbers 1 -> n races are valid as well as last and next.
    ///     - finishPosition: Filters for only circuits that have had a race where a specific finishing position was valid.
    public func getCircuits(season: String?, round: String?, finishPosition: String) async -> Result<MRData<CircuitTable>> {
        return await execute(JolpicaRequest(
            endpoint: .results,
            season: season,
            round: round,
            filters: [finishPosition, Endpoint.circuits.rawValue]
        ))
    }
    
    /// Filters for only circuits that have had a race where a driver finished with a specific statusId.
    ///
    /// - Parameters:
    ///     - season: Filters only circuits which hosted a race in a given season. Year numbers are valid as is current to get the current season's list of circuits.
    ///     - round: Filters only for the circuit that hosted the race in the specified round of the specific season. Round numbers 1 -> n races are valid as well as last and next.
    ///     - statusId: Filters for only circuits that have had a race where a driver finished with a specific statusId.
    public func getCircuits(season: String?, round: String?, statusId: String) async -> Result<MRData<CircuitTable>> {
        return await execute(JolpicaRequest(
            endpoint: .status,
            season: season,
            round: round,
            filters: [statusId, Endpoint.circuits.rawValue]
        ))
    }
}
