//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

public struct RaceResult: RaceAdditionalData {
    public static var dataKey: String { "Results" }
    
    public let number: String
    public let position: String
    public let positionText: String
    public let points: String
    public let driver: Driver
    public let constructor: Constructor?
    public let grid: String?
    public let laps: String?
    public let status: String?
    public let fastestLap: FastestLap?
}
