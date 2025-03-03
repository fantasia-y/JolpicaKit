//
//  Status.swift
//  JolpicaKit
//
//  Created by Gordon on 07.02.2025.
//

import Foundation

public class StatusEndpoint: JolpicaEndpoint, @unchecked Sendable {
    public func getStatus(season: String? = nil, offset: Int? = nil, limit: Int? = nil) async -> Result<MRData<StatusTable>> {
        return await execute(JolpicaRequest(
            endpoint: .status,
            season: season,
            offset: offset,
            limit: limit
        ))
    }
}
