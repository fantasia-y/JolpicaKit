//
//  Seasons.swift
//  JolpicaKit
//
//  Created by Gordon on 06.02.2025.
//

import Foundation

struct SeasonTable: ResultData {
    static var resultKey: String { "SeasonTable" }
    
    let seasons: [Season]
    
    enum CodingKeys: String, CodingKey {
        case seasons = "Seasons"
    }
}

struct Season: Decodable {
    let season: String
    let url: String
}

extension Jolpica {
    public func getSeasons(season: String?) async -> Result<MRData<SeasonTable>> {
        let request = formRequest(season: season, round: nil, endpoint: "seasons", filters: [])
        
        return await self.request(request: request, decode: MRData<SeasonTable>.self)
    }
    
    public func getSeasons(season: String?, circuitId: String) async -> Result<MRData<SeasonTable>> {
        let request = formRequest(season: season, round: nil, endpoint: "circuits", filters: [circuitId, "seasons"])
        
        return await self.request(request: request, decode: MRData<SeasonTable>.self)
    }
    
    public func getSeasons(season: String?, constructorId: String) async -> Result<MRData<SeasonTable>> {
        let request = formRequest(season: season, round: nil, endpoint: "constructors", filters: [constructorId, "seasons"])
        
        return await self.request(request: request, decode: MRData<SeasonTable>.self)
    }
    
    public func getSeasons(season: String?, driverId: String) async -> Result<MRData<SeasonTable>> {
        let request = formRequest(season: season, round: nil, endpoint: "drivers", filters: [driverId, "seasons"])
        
        return await self.request(request: request, decode: MRData<SeasonTable>.self)
    }
    
    public func getSeasons(season: String?, gridPosition: String) async -> Result<MRData<SeasonTable>> {
        let request = formRequest(season: season, round: nil, endpoint: "grid", filters: [gridPosition, "seasons"])
        
        return await self.request(request: request, decode: MRData<SeasonTable>.self)
    }
    
    public func getSeasons(season: String?, statusId: String) async -> Result<MRData<SeasonTable>> {
        let request = formRequest(season: season, round: nil, endpoint: "status", filters: [statusId, "seasons"])
        
        return await self.request(request: request, decode: MRData<SeasonTable>.self)
    }
}
