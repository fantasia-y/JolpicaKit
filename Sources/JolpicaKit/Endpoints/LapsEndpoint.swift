//
//  Laps.swift
//  JolpicaKit
//
//  Created by Gordon on 07.02.2025.
//

import Foundation

public class LapsEndpoint: JolpicaEndpoint, @unchecked Sendable {
    /// Returns a list of data for laps from a given race.
    ///
    /// - Note: Data starts from the 1996 season.
    ///
    /// - Parameters:
    ///     - season: Filters for the season that the list of laps will be from. Year numbers are valid as is current to get the laps of a given round in the current season.
    ///     - round: Filters for the round in a specific season that the list of laps will be from. Round numbers 1 -> n races are valid as well as last.
    ///     - statusId: Filters for only drivers who have finished a race with a specific statusId.
    public func getLaps(season: String, round: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<Lap>>> {
        return await execute(JolpicaRequest(
            endpoint: .laps,
            season: season,
            round: round,
            offset: offset,
            limit: limit
        ))
    }
    
    /// Filters for the nth lap for each driver in a given race.
    ///
    /// - Note: Data starts from the 1996 season.
    ///
    /// - Parameters:
    ///     - season: Filters for the season that the list of laps will be from. Year numbers are valid as is current to get the laps of a given round in the current season.
    ///     - round: Filters for the round in a specific season that the list of laps will be from. Round numbers 1 -> n races are valid as well as last.
    ///     - lapNumber: Filters for the nth lap for each driver in a given race.
    public func getLaps(season: String, round: String, lapNumber: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<Lap>>> {
        return await execute(JolpicaRequest(
            endpoint: .laps,
            season: season,
            round: round,
            filters: [lapNumber],
            offset: offset,
            limit: limit
        ))
    }
    
    /// Filters for only for a specific drivers's list of laps in a specific race.
    ///
    /// - Note: Data starts from the 1996 season.
    ///
    /// - Parameters:
    ///     - season: Filters for the season that the list of laps will be from. Year numbers are valid as is current to get the laps of a given round in the current season.
    ///     - round: Filters for the round in a specific season that the list of laps will be from. Round numbers 1 -> n races are valid as well as last.
    ///     - driverId: Filters for only for a specific drivers's list of laps in a specific race.
    public func getLaps(season: String, round: String, driverId: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<Lap>>> {
        return await execute(JolpicaRequest(
            endpoint: .drivers,
            season: season,
            round: round,
            filters: [driverId, Endpoint.laps.rawValue],
            offset: offset,
            limit: limit
        ))
    }
    
    /// Filters for the lap data for the drivers of a specific constructor in a given race.
    ///
    /// - Note: Data starts from the 1996 season.
    ///
    /// - Parameters:
    ///     - season: Filters for the season that the list of laps will be from. Year numbers are valid as is current to get the laps of a given round in the current season.
    ///     - round: Filters for the round in a specific season that the list of laps will be from. Round numbers 1 -> n races are valid as well as last.
    ///     - constructorId: Filters for the lap data for the drivers of a specific constructor in a given race.
    public func getLaps(season: String, round: String, constructorId: String, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<RaceTableAnd<Lap>>> {
        return await execute(JolpicaRequest(
            endpoint: .constructors,
            season: season,
            round: round,
            filters: [constructorId, Endpoint.laps.rawValue],
            offset: offset,
            limit: limit
        ))
    }
}
