//
//  Constructors.swift
//  JolpicaKit
//
//  Created by Gordon on 05.02.2025.
//

import Foundation

struct ConstructorTable: ResultData {
    static var resultKey: String { "ConstructorTable" }
    
    let constructors: [Constructor]
    
    enum CodingKeys: String, CodingKey {
        case constructors = "Constructors"
    }
}

struct Constructor: Decodable {
    let constructorId: String?
    let url: String?
    let name: String
    let nationality: String?
}

extension Jolpica {
    public func getConstructors(season: String?, round: String?) async -> Result<MRData<ConstructorTable>> {
        let request = formRequest(season: season, round: round, endpoint: "circuits", filters: [])
        
        return await self.request(request: request, decode: MRData<ConstructorTable>.self)
    }
    
    public func getConstructors(season: String?, round: String?, circuitId: String) async -> Result<MRData<ConstructorTable>> {
        let request = formRequest(season: season, round: round, endpoint: "circuits", filters: [circuitId, "constructors"])
        
        return await self.request(request: request, decode: MRData<ConstructorTable>.self)
    }
    
    public func getConstructors(season: String?, round: String?, constructorId: String) async -> Result<MRData<ConstructorTable>> {
        let request = formRequest(season: season, round: round, endpoint: "constructors", filters: [constructorId])
        
        return await self.request(request: request, decode: MRData<ConstructorTable>.self)
    }
    
    public func getConstructors(season: String?, round: String?, driverId: String) async -> Result<MRData<ConstructorTable>> {
        let request = formRequest(season: season, round: round, endpoint: "drivers", filters: [driverId, "constructors"])
        
        return await self.request(request: request, decode: MRData<ConstructorTable>.self)
    }
    
    public func getConstructors(season: String?, round: String?, lapRank: String) async -> Result<MRData<ConstructorTable>> {
        let request = formRequest(season: season, round: round, endpoint: "fastest", filters: [lapRank, "constructors"])
        
        return await self.request(request: request, decode: MRData<ConstructorTable>.self)
    }
    
    public func getConstructors(season: String?, round: String?, gridPosition: String) async -> Result<MRData<ConstructorTable>> {
        let request = formRequest(season: season, round: round, endpoint: "grid", filters: [gridPosition, "constructors"])
        
        return await self.request(request: request, decode: MRData<ConstructorTable>.self)
    }
    
    public func getConstructors(season: String?, round: String?, finishPosition: String) async -> Result<MRData<ConstructorTable>> {
        let request = formRequest(season: season, round: round, endpoint: "results", filters: [finishPosition, "constructors"])
        
        return await self.request(request: request, decode: MRData<ConstructorTable>.self)
    }
    
    public func getConstructors(season: String?, round: String?, statusId: String) async -> Result<MRData<ConstructorTable>> {
        let request = formRequest(season: season, round: round, endpoint: "status", filters: [statusId, "constructors"])
        
        return await self.request(request: request, decode: MRData<ConstructorTable>.self)
    }
}
