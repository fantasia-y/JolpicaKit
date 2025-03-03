//
//  JolpicaKit.swift
//  JolpicaKit
//
//  Created by Gordon on 06.02.2025.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public struct JolpicaConfig {
    let baseURL = "https://api.jolpi.ca/ergast/f1"
    let enableLogging: Bool
    let cachePolicy: URLRequest.CachePolicy
    
    init(enableLogging: Bool = false, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) {
        self.enableLogging = enableLogging
        self.cachePolicy = cachePolicy
    }
}

public final class JolpicaClient: Sendable {
    public let circuits: CircuitsEndpoint
    public let constructors: ConstructorsEndpoint
    public let drivers: DriversEndpoint
    public let seasons: SeasonsEndpoint
    public let races: RacesEndpoint
    public let constructorStandings: ConstructorStandingsEndpoint
    public let driverStandings: DriverStandingsEndpoint
    public let status: StatusEndpoint
    public let laps: LapsEndpoint
    public let pitstops: PitstopsEndpoint
    public let qualifying: QualifyingsEndpoint
    public let results: ResultsEndpoint
    public let sprints: SprintsEndpoint
    
    public convenience init(enableLogging: Bool = false, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) {
        self.init(config: JolpicaConfig(
            enableLogging: enableLogging,
            cachePolicy: cachePolicy
        ))
    }
    
    public init(config: JolpicaConfig) {
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
