//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

public struct Pitstop: RaceAdditionalData {
    public static var dataKey: String { "PitStops" }
    
    public let driverId: String
    public let lap: String?
    public let stop: String?
    public let time: String?
    public let duration: String?
}
