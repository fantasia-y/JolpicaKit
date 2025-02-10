//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

struct QualifyingResults: RaceAdditionalData {
    static var dataKey: String { "QualifyingResults" }
    
    let number: String
    let position: String
    let driver: Driver
    let constructor: Constructor
    let q1: String?
    let q2: String?
    let q3: String?
    
    enum CodingKeys: String, CodingKey {
        case number
        case position
        case driver = "Driver"
        case constructor = "Constructor"
        case q1 = "Q1"
        case q2 = "Q2"
        case q3 = "Q3"
    }
}
