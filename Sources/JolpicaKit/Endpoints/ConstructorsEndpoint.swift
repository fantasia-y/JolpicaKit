//
//  Constructors.swift
//  JolpicaKit
//
//  Created by Gordon on 05.02.2025.
//

import Foundation

public class ConstructorsEndpoint: JolpicaEndpoint, @unchecked Sendable {
    /// Returns a list of constructors alphabetically by constructorId
    ///
    /// - Parameters:
    ///     - season: Filters only constructors that participated in a specified season. Year numbers are valid as is current to get the current season list of constructors.
    ///     - round: Filters only constructors that participated in a specified round of a specific season. Round numbers 1 -> n races are valid as well as last.
    public func getConstructors(season: String? = nil, round: String? = nil) async -> Result<MRData<ConstructorTable>> {
        return await execute(JolpicaRequest(
            endpoint: .constructors,
            season: season,
            round: round
        ))
    }
    
    /// Filters for only constructors who have participated in a race at a given circuit.
    ///
    /// - Parameters:
    ///     - season: Filters only constructors that participated in a specified season. Year numbers are valid as is current to get the current season list of constructors.
    ///     - round: Filters only constructors that participated in a specified round of a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - circuitId: Filters for only constructors who have participated in a race at a given circuit.
    public func getConstructors(season: String? = nil, round: String? = nil, circuitId: String) async -> Result<MRData<ConstructorTable>> {
        return await execute(JolpicaRequest(
            endpoint: .circuits,
            season: season,
            round: round,
            filters: [circuitId, Endpoint.constructors.rawValue]
        ))
    }
    
    /// Filters for only a specified constructor.
    ///
    /// - Parameters:
    ///     - season: Filters only constructors that participated in a specified season. Year numbers are valid as is current to get the current season list of constructors.
    ///     - round: Filters only constructors that participated in a specified round of a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - constructorId: Filters for only a specified constructor.
    public func getConstructors(season: String? = nil, round: String? = nil, constructorId: String) async -> Result<MRData<ConstructorTable>> {
        return await execute(JolpicaRequest(
            endpoint: .constructors,
            season: season,
            round: round,
            filters: [constructorId]
        ))
    }
    
    /// Filters for only constructors that had a driver race for them.
    ///
    /// - Parameters:
    ///     - season: Filters only constructors that participated in a specified season. Year numbers are valid as is current to get the current season list of constructors.
    ///     - round: Filters only constructors that participated in a specified round of a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - driverId: Filters for only constructors that had a driver race for them.
    public func getConstructors(season: String? = nil, round: String? = nil, driverId: String) async -> Result<MRData<ConstructorTable>> {
        return await execute(JolpicaRequest(
            endpoint: .drivers,
            season: season,
            round: round,
            filters: [driverId, Endpoint.constructors.rawValue]
        ))
    }
    
    /// Filters for only constructors that finished a race with a lap that was the ranked in the specified position.
    ///
    /// - Parameters:
    ///     - season: Filters only constructors that participated in a specified season. Year numbers are valid as is current to get the current season list of constructors.
    ///     - round: Filters only constructors that participated in a specified round of a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - lapRank: Filters for only constructors that finished a race with a lap that was the ranked in the specified position.
    public func getConstructors(season: String? = nil, round: String? = nil, lapRank: String) async -> Result<MRData<ConstructorTable>> {
        return await execute(JolpicaRequest(
            endpoint: .fastest,
            season: season,
            round: round,
            filters: [lapRank, Endpoint.constructors.rawValue]
        ))
    }
    
    /// Filters for only constructors which had a driver racing for them start a race in a specific grid position.
    ///
    /// - Parameters:
    ///     - season: Filters only constructors that participated in a specified season. Year numbers are valid as is current to get the current season list of constructors.
    ///     - round: Filters only constructors that participated in a specified round of a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - gridPosition: Filters for only constructors which had a driver racing for them start a race in a specific grid position.
    public func getConstructors(season: String? = nil, round: String? = nil, gridPosition: String) async -> Result<MRData<ConstructorTable>> {
        return await execute(JolpicaRequest(
            endpoint: .grid,
            season: season,
            round: round,
            filters: [gridPosition, Endpoint.constructors.rawValue]
        ))
    }
    
    /// Filters for only constructors which had a driver racing for them finish a race in a specific position.
    ///
    /// - Parameters:
    ///     - season: Filters only constructors that participated in a specified season. Year numbers are valid as is current to get the current season list of constructors.
    ///     - round: Filters only constructors that participated in a specified round of a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - finishPosition: Filters for only constructors which had a driver racing for them finish a race in a specific position.
    public func getConstructors(season: String? = nil, round: String? = nil, finishPosition: String) async -> Result<MRData<ConstructorTable>> {
        return await execute(JolpicaRequest(
            endpoint: .results,
            season: season,
            round: round,
            filters: [finishPosition, Endpoint.constructors.rawValue]
        ))
    }
    
    /// Filters for only constructors who had a driver finish a race with a specific statusId.
    ///
    /// - Parameters:
    ///     - season: Filters only constructors that participated in a specified season. Year numbers are valid as is current to get the current season list of constructors.
    ///     - round: Filters only constructors that participated in a specified round of a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - statusId: Filters for only constructors who had a driver finish a race with a specific statusId.
    public func getConstructors(season: String? = nil, round: String? = nil, statusId: String) async -> Result<MRData<ConstructorTable>> {
        return await execute(JolpicaRequest(
            endpoint: .status,
            season: season,
            round: round,
            filters: [statusId, Endpoint.constructors.rawValue]
        ))
    }
}
