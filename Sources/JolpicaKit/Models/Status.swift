//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

public struct StatusTable: ResultData {
    public static var resultKey: String { "StatusTable" }
    
    public let season: String?
    public let status: [Status]
    
    enum CodingKeys: String, CodingKey {
        case season
        case status = "Status"
    }
    
    public init(season: String?, status: [Status]) {
        self.season = season
        self.status = status
    }
}

public struct Status: Decodable, Sendable, Hashable {
    public let statusId: String
    public let count: String
    public let status: String
    
    public init(statusId: String, count: String, status: String) {
        self.statusId = statusId
        self.count = count
        self.status = status
    }
}
