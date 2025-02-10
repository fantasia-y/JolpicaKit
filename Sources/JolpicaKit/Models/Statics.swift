//
//  Statics.swift
//  JolpicaKit
//
//  Created by Gordon on 05.02.2025.
//

import Foundation

struct MRData<T: ResultData>: Decodable {
    let xmlns: String
    let series: String
    let url: String
    let limit: String
    let offset: String
    let total: String
    let result: T

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

    init(from decoder: Decoder) throws {
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

protocol ResultData: Decodable {
    static var resultKey: String { get }
}

struct Location: Decodable {
    let lat: String
    let long: String
    let locality: String
    let country: String
}

struct Timing: Decodable {
    let driverId: String
    let position: String
    let time: String
}

struct Event: Decodable {
    let date: String
    let time: String
}

struct Time: Decodable {
    let millis: String?
    let time: String
}
