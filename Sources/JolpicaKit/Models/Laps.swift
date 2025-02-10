//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

public struct Lap: RaceAdditionalData {
    public static var dataKey: String { "Laps" }
    
    public let number: String
    public let timings: [Timing]
    
    enum CodingKeys: String, CodingKey {
        case number
        case timings = "Timings"
    }
}
