//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 04.06.2025.
//

import Foundation

public struct PaginatedScheduleSummaryList: Decodable, Sendable, Hashable {
    public let metadata: PaginationMetadata
    public let data: [ScheduleSummary]
}

public struct ScheduleSummary: Decodable, Sendable, Hashable {
    public let url: String
    public let year: Int
    public let wikipedia: String?
}

public struct RetrievedScheduleDetail: Decodable, Sendable, Hashable {
    public let metadata: DetailMetadata
    public let data: ScheduleDetail
}

public struct ScheduleDetail: Decodable, Sendable, Hashable {
    public let url: String
    public let year: Int
    public let wikipedia: String?
    public let rounds_info: ScheduleRoundsInfo?
    public let rounds: [ScheduleRound]?
}

public struct ScheduleRoundsInfo: Decodable, Sendable, Hashable {
    public let next: ScheduleRoundInfoDetail?
    public let previous: ScheduleRoundInfoDetail?
}

public struct ScheduleRoundInfoDetail: Decodable, Sendable, Hashable {
    public let number: Int
    public let index: Int
}

public struct ScheduleRound: Decodable, Sendable, Hashable {
    public let number: Int
    public let name: String?
    public let circuit: ScheduleCircuit
    public let date: String?
    public let sessions: [ScheduleSession]
}

public struct ScheduleCircuit: Decodable, Sendable, Hashable {
    public let name: String
    public let reference: String?
    public let wikipedia: String?
    public let latitude: Float?
    public let longitude: Float?
    public let altitude: Float?
    public let locality: String?
    public let country_code: String?
}

public struct ScheduleSession: Decodable, Sendable, Hashable {
    public let type: String
    public let type_display: String
    public let date: String
    public let time: String
}
