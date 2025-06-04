//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 04.06.2025.
//

import Foundation

public class SessionEndpoint: JolpicaEndpoint, @unchecked Sendable {
    /// Provides a paginated list of all available F1 sessions with links to their details.
    ///
    /// - Parameters:
    ///     - page: A page number within the paginated result set.
    public func getSessions(page: Int? = nil) async -> Result<PaginatedSessionSummaryList> {
        return await execute(JolpicaRequest(
            endpoint: .sessions,
            query: page != nil ? ["page": "\(page!)"] : [:]
        ))
    }
    
    /// Provides detailed information for a specific F1 session, including position, timing, and driver/team information.
    ///
    /// - Parameters:
    ///     - year
    ///     - roundNumber
    ///     - sessionType
    public func getSessions(year: Int, roundNumber: Int, sessionType: String) async -> Result<PaginatedSessionSummaryList> {
        return await execute(JolpicaRequest(
            endpoint: .sessions,
            path: [String(year), String(roundNumber), sessionType]
        ))
    }
}
