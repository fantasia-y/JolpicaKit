//
//  Status.swift
//  JolpicaKit
//
//  Created by Gordon on 07.02.2025.
//

import Foundation

struct StatusTable: ResultData {
    static var resultKey: String { "StatusTable" }
    
    let season: String?
    let status: [Status]
    
    enum CodingKeys: String, CodingKey {
        case season
        case status = "Status"
    }
}

struct Status: Decodable {
    let statusId: String
    let count: String
    let status: String
}

extension Jolpica {
    public func getStatus(season: String?) async -> Result<MRData<StatusTable>> {
        let request = formRequest(season: season, round: nil, endpoint: "status", filters: [])
        
        return await self.request(request: request, decode: MRData<StatusTable>.self)
    }
}
