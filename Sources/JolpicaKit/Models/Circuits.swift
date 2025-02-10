//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
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
