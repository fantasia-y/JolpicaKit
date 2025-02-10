//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

struct RaceResult: RaceAdditionalData {
    static var dataKey: String { "Results" }
    
    let number: String
    let position: String
    let positionText: String
    let points: String
    let driver: Driver
    let constructor: Constructor?
    let grid: String?
    let laps: String?
    let status: String?
    let fastestLap: FastestLap?
}
