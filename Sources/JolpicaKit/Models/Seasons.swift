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
    
    public init(seasons: [Season]) {
        self.seasons = seasons
    }
}

public struct Season: Decodable, Sendable, Hashable {
    public let season: String
    public let url: String
    
    public init(season: String, url: String) {
        self.season = season
        self.url = url
    }
}
