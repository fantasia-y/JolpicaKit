//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
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
