//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

public struct Sprint: RaceAdditionalData {
    public static var dataKey: String { "SprintResults" }
    
    public let number: String
    public let position: String
    public let positionText: String
    public let points: String
    public let driver: Driver
    public let constructor: Constructor?
    public let grid: String?
    public let laps: String?
    public let status: String?
    public let time: Time?
    public let fastestLap: FastestLap?
    
    public init(number: String, position: String, positionText: String, points: String, driver: Driver, constructor: Constructor?, grid: String?, laps: String?, status: String?, time: Time?, fastestLap: FastestLap?) {
        self.number = number
        self.position = position
        self.positionText = positionText
        self.points = points
        self.driver = driver
        self.constructor = constructor
        self.grid = grid
        self.laps = laps
        self.status = status
        self.time = time
        self.fastestLap = fastestLap
    }
}
