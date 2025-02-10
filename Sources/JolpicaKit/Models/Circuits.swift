//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

public struct CircuitTable: ResultData {
    public static var resultKey: String { "CircuitTable" }
    
    public let circuits: [Circuit]
    
    enum CodingKeys: String, CodingKey {
        case circuits = "Circuits"
    }
}

public struct Circuit: Decodable, Sendable {
    public let circuitId: String
    public let url: String
    public let circuitName: String
    public let location: Location
    
    enum CodingKeys: String, CodingKey {
        case circuitId
        case url
        case circuitName
        case location = "Location"
    }
}
