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
    
    enum CodingKeys: String, CodingKey {
        case number
        case position
        case positionText
        case points
        case driver = "Driver"
        case constructor = "Constructor"
        case grid
        case laps
        case status
        case fastestLap = "FastetLap"
    }
    
    public init(number: String, position: String, positionText: String, points: String, driver: Driver, constructor: Constructor?, grid: String?, laps: String?, status: String?, fastestLap: FastestLap?) {
        self.number = number
        self.position = position
        self.positionText = positionText
        self.points = points
        self.driver = driver
        self.constructor = constructor
        self.grid = grid
        self.laps = laps
        self.status = status
        self.fastestLap = fastestLap
    }
}
