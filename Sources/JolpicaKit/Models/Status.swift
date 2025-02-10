//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

struct StatusTable: ResultData {
    static var resultKey: String { "StatusTable" }
    
    let season: String?
    let status: [Status]
    
    enum CodingKeys: String, CodingKey {
        case season
        case status = "Status"
    }
}

struct Status: Decodable {
    let statusId: String
    let count: String
    let status: String
}
