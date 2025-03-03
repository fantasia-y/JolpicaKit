//
//  Statics.swift
//  JolpicaKit
//
//  Created by Gordon on 05.02.2025.
//

import Foundation

public struct MRData<T: ResultData>: Decodable, Sendable, Hashable {
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
    
    public init(xmlns: String, series: String, url: String, limit: String, offset: String, total: String, result: T) {
        self.xmlns = xmlns
        self.series = series
        self.url = url
        self.limit = limit
        self.offset = offset
        self.total = total
        self.result = result
    }
}

public protocol ResultData: Decodable, Sendable, Hashable {
    static var resultKey: String { get }
}

public struct Location: Decodable, Sendable, Hashable {
    public let lat: String
    public let long: String
    public let locality: String
    public let country: String
    
    public init(lat: String, long: String, locality: String, country: String) {
        self.lat = lat
        self.long = long
        self.locality = locality
        self.country = country
    }
}

public struct Timing: Decodable, Sendable, Hashable {
    public let driverId: String
    public let position: String
    public let time: String
    
    public init(driverId: String, position: String, time: String) {
        self.driverId = driverId
        self.position = position
        self.time = time
    }
}

public struct Event: Decodable, Sendable, Hashable {
    public let date: Date
    public let time: String?
    
    public init(date: Date, time: String?) {
        self.date = date
        self.time = time
    }
}

public struct Time: Decodable, Sendable, Hashable {
    public let millis: String?
    public let time: String
    
    public init(millis: String?, time: String) {
        self.millis = millis
        self.time = time
    }
}
