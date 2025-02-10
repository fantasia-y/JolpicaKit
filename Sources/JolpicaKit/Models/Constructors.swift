//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

struct ConstructorTable: ResultData {
    static var resultKey: String { "ConstructorTable" }
    
    let constructors: [Constructor]
    
    enum CodingKeys: String, CodingKey {
        case constructors = "Constructors"
    }
}

struct Constructor: Decodable {
    let constructorId: String?
    let url: String?
    let name: String
    let nationality: String?
}
