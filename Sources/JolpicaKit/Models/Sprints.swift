//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

struct Sprint: RaceAdditionalData {
    static var dataKey: String { "SprintResults" }
    
    let number: String
    let position: String
    let positionText: String
    let points: String
    let driver: Driver
    let constructor: Constructor?
    let grid: String?
    let laps: String?
    let status: String?
    let time: Time?
    let fastestLap: FastestLap?
}
