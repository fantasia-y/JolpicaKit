//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

public struct QualifyingResults: RaceAdditionalData {
    public static var dataKey: String { "QualifyingResults" }
    
    public let number: String
    public let position: String
    public let driver: Driver
    public let constructor: Constructor
    public let q1: String?
    public let q2: String?
    public let q3: String?
    
    enum CodingKeys: String, CodingKey {
        case number
        case position
        case driver = "Driver"
        case constructor = "Constructor"
        case q1 = "Q1"
        case q2 = "Q2"
        case q3 = "Q3"
    }
    
    public init(number: String, position: String, driver: Driver, constructor: Constructor, q1: String?, q2: String?, q3: String?) {
        self.number = number
        self.position = position
        self.driver = driver
        self.constructor = constructor
        self.q1 = q1
        self.q2 = q2
        self.q3 = q3
    }
}
