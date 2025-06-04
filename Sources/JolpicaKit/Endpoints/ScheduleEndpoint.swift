//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 04.06.2025.
//

import Foundation

public class ScheduleEndpoint: JolpicaEndpoint, @unchecked Sendable {
    /// Provides a paginated list of all available F1 seasons with links to their detailed schedule.
    ///
    /// - Parameters:
    ///     - page: A page number within the paginated result set.
    public func getSchedules(page: Int? = nil) async -> Result<PaginatedScheduleSummaryList> {
        return await execute(JolpicaRequest(
            endpoint: .schedules,
            query: page != nil ? ["page": "\(page!)"] : [:]
        ))
    }
    
    /// Provides the full schedule for a given season year, including rounds, sessions, and circuit details.
    ///
    /// - Parameters:
    ///     - year
    public func getSchedules(year: Int) async -> Result<RetrievedScheduleDetail> {
        return await execute(JolpicaRequest(
            endpoint: .schedules,
            path: [String(year)]
        ))
    }
}
