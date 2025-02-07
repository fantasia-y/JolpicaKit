//
//  Qualifyings.swift
//  JolpicaKit
//
//  Created by Gordon on 07.02.2025.
//

import Foundation

struct QualifyingResults: RaceAdditionalData {
    static var dataKey: String { "QualifyingResults" }
    
    let number: String
    let position: String
    let driver: Driver
    let constructor: Constructor
    let q1: String?
    let q2: String?
    let q3: String?
    
    enum CodingKeys: String, CodingKey {
        case number
        case position
        case driver = "Driver"
        case constructor = "Constructor"
        case q1 = "Q1"
        case q2 = "Q2"
        case q3 = "Q3"
    }
}

extension Jolpica {
    public func getQualifyings(season: String?, round: String?) async -> Result<MRData<RaceTableAnd<QualifyingResults>>> {
        let request = formRequest(season: season, round: round, endpoint: "qualifying", filters: [])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<QualifyingResults>>.self)
    }
    
    public func getQualifyings(season: String?, round: String?, circuitId: String) async -> Result<MRData<RaceTableAnd<QualifyingResults>>> {
        let request = formRequest(season: season, round: round, endpoint: "circuits", filters: [circuitId, "qualifying"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<QualifyingResults>>.self)
    }
    
    public func getQualifyings(season: String?, round: String?, constructorId: String) async -> Result<MRData<RaceTableAnd<QualifyingResults>>> {
        let request = formRequest(season: season, round: round, endpoint: "constructors", filters: [constructorId, "qualifying"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<QualifyingResults>>.self)
    }
    
    public func getQualifyings(season: String?, round: String?, driverId: String) async -> Result<MRData<RaceTableAnd<QualifyingResults>>> {
        let request = formRequest(season: season, round: round, endpoint: "drivers", filters: [driverId, "qualifying"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<QualifyingResults>>.self)
    }
    
    public func getQualifyings(season: String?, round: String?, gridPosition: String) async -> Result<MRData<RaceTableAnd<QualifyingResults>>> {
        let request = formRequest(season: season, round: round, endpoint: "grid", filters: [gridPosition, "qualifying"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<QualifyingResults>>.self)
    }
    
    public func getQualifyings(season: String?, round: String?, lapRank: String) async -> Result<MRData<RaceTableAnd<QualifyingResults>>> {
        let request = formRequest(season: season, round: round, endpoint: "fastest", filters: [lapRank, "qualifying"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<QualifyingResults>>.self)
    }
    
    public func getQualifyings(season: String?, round: String?, statusId: String) async -> Result<MRData<RaceTableAnd<QualifyingResults>>> {
        let request = formRequest(season: season, round: round, endpoint: "status", filters: [statusId, "qualifying"])
        
        return await self.request(request: request, decode: MRData<RaceTableAnd<QualifyingResults>>.self)
    }
}
