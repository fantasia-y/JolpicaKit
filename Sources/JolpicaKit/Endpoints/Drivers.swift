//
//  Drivers.swift
//  JolpicaKit
//
//  Created by Gordon on 05.02.2025.
//

import Foundation

struct DriverTable: ResultData {
    static var resultKey: String { "DriverTable" }
    
    let drivers: [Driver]
    
    enum CodingKeys: String, CodingKey {
        case drivers = "Drivers"
    }
}

struct Driver: Codable {
    let driverId: String
    let permanentNumber: String?
    let code: String?
    let url: String?
    let givenName: String
    let familyName: String
    let dateOfBirth: String?
    let nationality: String?
}

extension Jolpica {
    public func getDrivers(season: String?, round: String?) async -> Result<MRData<DriverTable>> {
        let request = formRequest(season: season, round: round, endpoint: "circuits", filters: [])
        
        return await self.request(request: request, decode: MRData<DriverTable>.self)
    }
    
    public func getDrivers(season: String?, round: String?, circuitId: String) async -> Result<MRData<DriverTable>> {
        let request = formRequest(season: season, round: round, endpoint: "circuits", filters: [circuitId, "drivers"])
        
        return await self.request(request: request, decode: MRData<DriverTable>.self)
    }
    
    public func getDrivers(season: String?, round: String?, constructorId: String) async -> Result<MRData<DriverTable>> {
        let request = formRequest(season: season, round: round, endpoint: "constructors", filters: [constructorId, "drivers"])
        
        return await self.request(request: request, decode: MRData<DriverTable>.self)
    }
    
    public func getDrivers(season: String?, round: String?, driverId: String) async -> Result<MRData<DriverTable>> {
        let request = formRequest(season: season, round: round, endpoint: "drivers", filters: [driverId])
        
        return await self.request(request: request, decode: MRData<DriverTable>.self)
    }
    
    public func getDrivers(season: String?, round: String?, lapRank: String) async -> Result<MRData<DriverTable>> {
        let request = formRequest(season: season, round: round, endpoint: "fastest", filters: [lapRank, "drivers"])
        
        return await self.request(request: request, decode: MRData<DriverTable>.self)
    }
    
    public func getDrivers(season: String?, round: String?, gridPosition: String) async -> Result<MRData<DriverTable>> {
        let request = formRequest(season: season, round: round, endpoint: "grid", filters: [gridPosition, "drivers"])
        
        return await self.request(request: request, decode: MRData<DriverTable>.self)
    }
    
    public func getDrivers(season: String?, round: String?, finishPosition: String) async -> Result<MRData<DriverTable>> {
        let request = formRequest(season: season, round: round, endpoint: "results", filters: [finishPosition, "drivers"])
        
        return await self.request(request: request, decode: MRData<DriverTable>.self)
    }
    
    public func getDrivers(season: String?, round: String?, statusId: String) async -> Result<MRData<DriverTable>> {
        let request = formRequest(season: season, round: round, endpoint: "status", filters: [statusId, "drivers"])
        
        return await self.request(request: request, decode: MRData<DriverTable>.self)
    }
}
