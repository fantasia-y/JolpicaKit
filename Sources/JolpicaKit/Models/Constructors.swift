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
    
    public init(constructors: [Constructor]) {
        self.constructors = constructors
    }
}

public struct Constructor: Decodable, Sendable, Hashable {
    public let constructorId: String?
    public let url: String?
    public let name: String
    public let nationality: String?
    
    public init(constructorId: String?, url: String?, name: String, nationality: String?) {
        self.constructorId = constructorId
        self.url = url
        self.name = name
        self.nationality = nationality
    }
}
