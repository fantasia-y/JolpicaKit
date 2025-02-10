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
}

public struct Driver: Codable {
    public let driverId: String
    public let permanentNumber: String?
    public let code: String?
    public let url: String?
    public let givenName: String
    public let familyName: String
    public let dateOfBirth: String?
    public let nationality: String?
}
