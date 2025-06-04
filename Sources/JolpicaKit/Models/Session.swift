//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 04.06.2025.
//

import Foundation

public struct PaginatedSessionSummaryList: Decodable, Sendable, Hashable {
    public let metadata: PaginationMetadata
    public let data: [SessionSummary]
}

public struct SessionSummary: Decodable, Sendable, Hashable {
    public let url: String
    public let type: String
    public let type_display: String
    public let date: String?
    public let time: String?
    public let round: SessionRound
    public let season_year: Int
}

public struct SessionRound: Decodable, Sendable, Hashable {
    public let number: Int
    public let name: String?
}

public struct RetrievedSessionDetail: Decodable, Sendable, Hashable {
    public let metadata: DetailMetadata
    public let data: SessionDetail
}

public struct SessionDetail: Decodable, Sendable, Hashable {
    public let url: String
    public let type: String
    public let type_display: String
    public let date: String?
    public let time: String?
    public let round: SessionRound
    public let season_year: Int
    public let circuit: ScheduleCircuit
    public let results: [SessionResult]
}

public struct SessionResult: Decodable, Sendable, Hashable {
    public let position_order: Int
    public let position_display: String
    public let car_number: String?
    public let points: Int?
    public let grid_order: Int?
    public let completed_laps: Int?
    public let is_classified: Bool?
    public let classification: String?
    public let time: SessionTime?
    public let fastest_laps: [SessionLap]?
    public let driver: SessionDriver
    public let team: SessionTeam
}

public struct SessionTime: Decodable, Sendable, Hashable {
    public let milliseconds: Int
}

public struct SessionLap: Decodable, Sendable, Hashable {
    public let session_type: String
    public let lap_number: Int?
    public let time: SessionTime?
    public let rank: Int?
}

public struct SessionDriver: Decodable, Sendable, Hashable {
    public let first_name: String
    public let last_name: String
    public let abbreviation: String?
    public let country_code: String?
}

public struct SessionTeam: Decodable, Sendable, Hashable {
    public let name: String
    public let country_code: String?
}
