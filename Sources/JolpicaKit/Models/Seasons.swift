//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

struct SeasonTable: ResultData {
    static var resultKey: String { "SeasonTable" }
    
    let seasons: [Season]
    
    enum CodingKeys: String, CodingKey {
        case seasons = "Seasons"
    }
}

struct Season: Decodable {
    let season: String
    let url: String
}
