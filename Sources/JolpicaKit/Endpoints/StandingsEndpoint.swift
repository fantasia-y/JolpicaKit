//
//  Standings.swift
//  JolpicaKit
//
//  Created by Gordon on 05.02.2025.
//

import Foundation

public class ConstructorStandingsEndpoint: JolpicaEndpoint, @unchecked Sendable {
    /// Returns a season's constructors standings from first to last place.
    ///
    /// - Parameters:
    ///     - season: Filters for the constructors standing of a specified season. Year numbers are valid as is current to get the current seasons constructors standings.
    ///     - round: Filters for the constructors standings after a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    public func getConstructorStandings(season: String, round: String? = nil) async -> Result<MRData<StandingsTable<ConstructorStanding>>> {
        return await execute(JolpicaRequest(
            endpoint: .constructorstandings,
            season: season,
            round: round
        ))
    }
    
    /// Filters for only for a specific constructors' standing information for a given year.
    ///
    /// - Parameters:
    ///     - season: Filters for the constructors standing of a specified season. Year numbers are valid as is current to get the current seasons constructors standings.
    ///     - round: Filters for the constructors standings after a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - constructorId: Filters for only for a specific constructors' standing information for a given year.
    public func getConstructorStandings(season: String, round: String? = nil, constructorId: String) async -> Result<MRData<StandingsTable<ConstructorStanding>>> {
        return await execute(JolpicaRequest(
            endpoint: .constructors,
            season: season,
            round: round,
            filters: [constructorId, Endpoint.constructorstandings.rawValue]
        ))
    }
    
    /// Filters for only the constructor in a given position in a given year.
    ///
    /// - Parameters:
    ///     - season: Filters for the constructors standing of a specified season. Year numbers are valid as is current to get the current seasons constructors standings.
    ///     - round: Filters for the constructors standings after a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - finishPosition: Filters for only the constructor in a given position in a given year.
    public func getConstructorStandings(season: String, round: String? = nil, finishPosition: String) async -> Result<MRData<StandingsTable<ConstructorStanding>>> {
        return await execute(JolpicaRequest(
            endpoint: .constructorstandings,
            season: season,
            round: round,
            filters: [finishPosition]
        ))
    }
}

public class DriverStandingsEndpoint: JolpicaEndpoint, @unchecked Sendable {
    /// Returns a season's drivers standings from first to last place.
    ///
    /// - Parameters:
    ///     - season: Filters for the drivers standing of a specified season. Year numbers are valid as is current to get the current seasons drivers standings.
    ///     - round: Filters for the drivers standings after a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    public func getDriverStandings(season: String, round: String? = nil) async -> Result<MRData<StandingsTable<ConstructorStanding>>> {
        return await execute(JolpicaRequest(
            endpoint: .driverstandings,
            season: season,
            round: round
        ))
    }
    
    /// Filters for only a specific driver's drivers standing information for a given year.
    ///
    /// - Parameters:
    ///     - season: Filters for the drivers standing of a specified season. Year numbers are valid as is current to get the current seasons drivers standings.
    ///     - round: Filters for the drivers standings after a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - driverId: Filters for only a specific driver's drivers standing information for a given year.
    public func getDriverStandings(season: String, round: String? = nil, driverId: String) async -> Result<MRData<StandingsTable<ConstructorStanding>>> {
        return await execute(JolpicaRequest(
            endpoint: .drivers,
            season: season,
            round: round,
            filters: [driverId, Endpoint.driverstandings.rawValue]
        ))
    }
    
    /// Filters for only the driver in a given position for a given year.
    ///
    /// - Parameters:
    ///     - season: Filters for the drivers standing of a specified season. Year numbers are valid as is current to get the current seasons drivers standings.
    ///     - round: Filters for the drivers standings after a specified round in a specific season. Round numbers 1 -> n races are valid as well as last.
    ///     - finishPosition: Filters for only the driver in a given position for a given year.
    public func getDriverStandings(season: String, round: String? = nil, finishPosition: String) async -> Result<MRData<StandingsTable<ConstructorStanding>>> {
        return await execute(JolpicaRequest(
            endpoint: .driverstandings,
            season: season,
            round: round,
            filters: [finishPosition]
        ))
    }
}
