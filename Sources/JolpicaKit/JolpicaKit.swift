//
//  JolpicaKit.swift
//  JolpicaKit
//
//  Created by Gordon on 06.02.2025.
//

import Foundation

struct JolpicaConfig {
    let baseURL = "https://api.jolpi.ca/ergast/f1"
    let enableLogging: Bool
    
    init(enableLogging: Bool = false) {
        self.enableLogging = enableLogging
    }
}

final class JolpicaClient: Sendable {
    let circuits: CircuitsEndpoint
    let constructors: ConstructorsEndpoint
    let drivers: DriversEndpoint
    let seasons: SeasonsEndpoint
    let races: RacesEndpoint
    let constructorStandings: ConstructorStandingsEndpoint
    let driverStandings: DriverStandingsEndpoint
    let status: StatusEndpoint
    let laps: LapsEndpoint
    let pitstops: PitstopsEndpoint
    let qualifying: QualifyingsEndpoint
    let results: ResultsEndpoint
    let sprints: SprintsEndpoint
    
    convenience init(enableLogging: Bool = false) {
        self.init(config: JolpicaConfig(
            enableLogging: enableLogging
        ))
    }
    
    init(config: JolpicaConfig) {
        self.circuits = CircuitsEndpoint(config: config)
        self.constructors = ConstructorsEndpoint(config: config)
        self.drivers = DriversEndpoint(config: config)
        self.seasons = SeasonsEndpoint(config: config)
        self.races = RacesEndpoint(config: config)
        self.constructorStandings = ConstructorStandingsEndpoint(config: config)
        self.driverStandings = DriverStandingsEndpoint(config: config)
        self.status = StatusEndpoint(config: config)
        self.laps = LapsEndpoint(config: config)
        self.pitstops = PitstopsEndpoint(config: config)
        self.qualifying = QualifyingsEndpoint(config: config)
        self.results = ResultsEndpoint(config: config)
        self.sprints = SprintsEndpoint(config: config)
    }
}
