//
//  Statics.swift
//  JolpicaKit
//
//  Created by Gordon on 05.02.2025.
//

import Foundation

public struct MRData<T: ResultData>: Decodable, Sendable {
    public let xmlns: String
    public let series: String
    public let url: String
    public let limit: String
    public let offset: String
    public let total: String
    public let result: T

    struct CodingKeys: CodingKey {
        let stringValue: String
        let intValue: Int? = nil
        
        init?(intValue: Int) {
            return nil
        }
        
        init(stringValue: String) {
            self.stringValue = stringValue
        }
        
        static var result: Self { Self(stringValue: T.resultKey) }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.xmlns = try container.decode(String.self, forKey: CodingKeys(stringValue: "xmlns"))
        self.series = try container.decode(String.self, forKey: CodingKeys(stringValue: "series"))
        self.url = try container.decode(String.self, forKey: CodingKeys(stringValue: "url"))
        self.limit = try container.decode(String.self, forKey: CodingKeys(stringValue: "limit"))
        self.offset = try container.decode(String.self, forKey: CodingKeys(stringValue: "offset"))
        self.total = try container.decode(String.self, forKey: CodingKeys(stringValue: "total"))
        self.result = try container.decode(T.self, forKey: CodingKeys.result)
    }
}

public protocol ResultData: Decodable, Sendable {
    static var resultKey: String { get }
}

public struct Location: Decodable, Sendable {
    public let lat: String
    public let long: String
    public let locality: String
    public let country: String
}

public struct Timing: Decodable, Sendable {
    public let driverId: String
    public let position: String
    public let time: String
}

public struct Event: Decodable, Sendable {
    public let date: String
    public let time: String?
}

public struct Time: Decodable, Sendable {
    public let millis: String?
    public let time: String
}
