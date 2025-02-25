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
    
    public init(circuits: [Circuit]) {
        self.circuits = circuits
    }
}

public struct Circuit: Decodable, Sendable, Hashable {
    public let circuitId: String
    public let url: String
    public let circuitName: String
    public let location: Location
    
    public init(circuitId: String, url: String, circuitName: String, location: Location) {
        self.circuitId = circuitId
        self.url = url
        self.circuitName = circuitName
        self.location = location
    }
    
    enum CodingKeys: String, CodingKey {
        case circuitId
        case url
        case circuitName
        case location = "Location"
    }
}
