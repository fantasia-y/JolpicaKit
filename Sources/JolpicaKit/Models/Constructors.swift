//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

public struct ConstructorTable: ResultData {
    public static var resultKey: String { "ConstructorTable" }
    
    public let constructors: [Constructor]
    
    enum CodingKeys: String, CodingKey {
        case constructors = "Constructors"
    }
}

public struct Constructor: Decodable, Sendable {
    public let constructorId: String?
    public let url: String?
    public let name: String
    public let nationality: String?
}
