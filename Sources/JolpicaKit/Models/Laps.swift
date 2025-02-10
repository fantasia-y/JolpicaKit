//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

struct Lap: RaceAdditionalData {
    static var dataKey: String { "Laps" }
    
    let number: String
    let timings: Timing
    
    enum CodingKeys: String, CodingKey {
        case number
        case timings = "Timings"
    }
}
