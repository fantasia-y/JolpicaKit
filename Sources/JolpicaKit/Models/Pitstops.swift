//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation

struct Pitstop: RaceAdditionalData {
    static var dataKey: String { "PitStops" }
    
    let driverId: String
    let lap: String?
    let stop: String?
    let time: String?
    let duration: String?
}
