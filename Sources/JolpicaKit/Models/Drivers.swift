//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

public struct DriverTable: ResultData {
    public static var resultKey: String { "DriverTable" }
    
    public let drivers: [Driver]
    
    enum CodingKeys: String, CodingKey {
        case drivers = "Drivers"
    }
    
    public init(drivers: [Driver]) {
        self.drivers = drivers
    }
}

public struct Driver: Codable, Sendable, Hashable {
    public let driverId: String
    public let permanentNumber: String?
    public let code: String?
    public let url: String?
    public let givenName: String
    public let familyName: String
    public let dateOfBirth: String?
    public let nationality: String?
    
    public init(driverId: String, permanentNumber: String?, code: String?, url: String?, givenName: String, familyName: String, dateOfBirth: String?, nationality: String?) {
        self.driverId = driverId
        self.permanentNumber = permanentNumber
        self.code = code
        self.url = url
        self.givenName = givenName
        self.familyName = familyName
        self.dateOfBirth = dateOfBirth
        self.nationality = nationality
    }
}
