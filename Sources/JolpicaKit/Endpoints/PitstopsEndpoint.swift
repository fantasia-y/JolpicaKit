//
//  Pitstops.swift
//  JolpicaKit
//
//  Created by Gordon on 07.02.2025.
//

import Foundation

public class PitstopsEndpoint: JolpicaEndpoint, @unchecked Sendable {
    /// Returns a given races list of pitstops, from earliest to latest time in which the pitstop occurred.
    ///
    /// - Note: Data starts from the 2011 season.
    ///
    /// - Parameters:
    ///     - season: Filters for the season that the list of pitstops will be from. Year numbers are valid as is current to get the pitstops of a given round in the current season.
    ///     - round: Filters for the round in a specific season that the list of pitstops will be from. Round numbers 1 -> n races are valid as well as last.
    ///     - constructorId: Filters for the lap data for the drivers of a specific constructor in a given race.
    public func getPitstops(season: String, round: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<Pitstop>>> {
        return await execute(JolpicaRequest(
            endpoint: .pitstops,
            season: season,
            round: round,
            offset: offset,
            limit: limit
        ))
    }
    
    /// Filters for the nth stop for each driver in a given race.
    ///
    /// - Note: Data starts from the 2011 season.
    ///
    /// - Parameters:
    ///     - season: Filters for the season that the list of pitstops will be from. Year numbers are valid as is current to get the pitstops of a given round in the current season.
    ///     - round: Filters for the round in a specific season that the list of pitstops will be from. Round numbers 1 -> n races are valid as well as last.
    ///     - stopNumber: Filters for the nth stop for each driver in a given race.
    public func getPitstops(season: String, round: String, stopNumber: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<Pitstop>>> {
        return await execute(JolpicaRequest(
            endpoint: .pitstops,
            season: season,
            round: round,
            filters: [stopNumber],
            offset: offset,
            limit: limit
        ))
    }
    
    /// Filters for only for a specific drivers's list of pitstops in a season's round.
    ///
    /// - Note: Data starts from the 2011 season.
    ///
    /// - Parameters:
    ///     - season: Filters for the season that the list of pitstops will be from. Year numbers are valid as is current to get the pitstops of a given round in the current season.
    ///     - round: Filters for the round in a specific season that the list of pitstops will be from. Round numbers 1 -> n races are valid as well as last.
    ///     - driverId: Filters for only for a specific drivers's list of pitstops in a season's round.
    public func getPitstops(season: String, round: String, driverId: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<Pitstop>>> {
        return await execute(JolpicaRequest(
            endpoint: .drivers,
            season: season,
            round: round,
            filters: [driverId, Endpoint.pitstops.rawValue],
            offset: offset,
            limit: limit
        ))
    }
    
    /// Filters for only pitstops that took place in a given lap of a race.
    ///
    /// - Note: Data starts from the 2011 season.
    ///
    /// - Parameters:
    ///     - season: Filters for the season that the list of pitstops will be from. Year numbers are valid as is current to get the pitstops of a given round in the current season.
    ///     - round: Filters for the round in a specific season that the list of pitstops will be from. Round numbers 1 -> n races are valid as well as last.
    ///     - lapNumber: Filters for only pitstops that took place in a given lap of a race.
    public func getPitstops(season: String, round: String, lapNumber: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<Pitstop>>> {
        return await execute(JolpicaRequest(
            endpoint: .laps,
            season: season,
            round: round,
            filters: [lapNumber, Endpoint.pitstops.rawValue],
            offset: offset,
            limit: limit
        ))
    }
}
