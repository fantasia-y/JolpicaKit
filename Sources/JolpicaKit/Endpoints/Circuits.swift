//
//  Circuits.swift
//  JolpicaKit
//
//  Created by Gordon on 05.02.2025.
//

import Foundation

struct CircuitTable: ResultData {
    static var resultKey: String { "CircuitTable" }
    
    let circuits: [Circuit]
    
    enum CodingKeys: String, CodingKey {
        case circuits = "Circuits"
    }
}

struct Circuit: Decodable {
    let circuitId: String
    let url: String
    let circuitName: String
    let location: Location
    
    enum CodingKeys: String, CodingKey {
        case circuitId
        case url
        case circuitName
        case location = "Location"
    }
}

extension Jolpica {
    public func getCircuits(season: String?, round: String?) async -> Result<MRData<CircuitTable>> {
        let request = formRequest(season: season, round: round, endpoint: "circuits", filters: [])
        
        return await self.request(request: request, decode: MRData<CircuitTable>.self)
    }
    
    public func getCircuits(season: String?, round: String?, circuitId: String) async -> Result<MRData<CircuitTable>> {
        let request = formRequest(season: season, round: round, endpoint: "circuits", filters: [circuitId])
        
        return await self.request(request: request, decode: MRData<CircuitTable>.self)
    }
    
    public func getCircuits(season: String?, round: String?, constructorId: String) async -> Result<MRData<CircuitTable>> {
        let request = formRequest(season: season, round: round, endpoint: "constructors", filters: [constructorId, "circuits"])
        
        return await self.request(request: request, decode: MRData<CircuitTable>.self)
    }
    
    public func getCircuits(season: String?, round: String?, driverId: String) async -> Result<MRData<CircuitTable>> {
        let request = formRequest(season: season, round: round, endpoint: "drivers", filters: [driverId, "circuits"])
        
        return await self.request(request: request, decode: MRData<CircuitTable>.self)
    }
    
    public func getCircuits(season: String?, round: String?, lapRank: String) async -> Result<MRData<CircuitTable>> {
        let request = formRequest(season: season, round: round, endpoint: "fastest", filters: [lapRank, "circuits"])
        
        return await self.request(request: request, decode: MRData<CircuitTable>.self)
    }
    
    public func getCircuits(season: String?, round: String?, gridPosition: String) async -> Result<MRData<CircuitTable>> {
        let request = formRequest(season: season, round: round, endpoint: "grid", filters: [gridPosition, "circuits"])
        
        return await self.request(request: request, decode: MRData<CircuitTable>.self)
    }
    
    public func getCircuits(season: String?, round: String?, finishPosition: String) async -> Result<MRData<CircuitTable>> {
        let request = formRequest(season: season, round: round, endpoint: "results", filters: [finishPosition, "circuits"])
        
        return await self.request(request: request, decode: MRData<CircuitTable>.self)
    }
    
    public func getCircuits(season: String?, round: String?, statusId: String) async -> Result<MRData<CircuitTable>> {
        let request = formRequest(season: season, round: round, endpoint: "status", filters: [statusId, "circuits"])
        
        return await self.request(request: request, decode: MRData<CircuitTable>.self)
    }
}
