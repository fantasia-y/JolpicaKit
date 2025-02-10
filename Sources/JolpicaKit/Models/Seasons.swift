//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

public struct SeasonTable: ResultData {
    public static var resultKey: String { "SeasonTable" }
    
    public let seasons: [Season]
    
    enum CodingKeys: String, CodingKey {
        case seasons = "Seasons"
    }
}

public struct Season: Decodable, Sendable {
    public let season: String
    public let url: String
}
