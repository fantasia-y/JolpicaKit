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
    public let schedules: ScheduleEndpoint
    public let sessions: SessionEndpoint
    
    public convenience init(enableLogging: Bool = false, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) {
        self.init(config: JolpicaConfig(
            enableLogging: enableLogging,
            cachePolicy: cachePolicy
        ))
    }
    
    public init(config: JolpicaConfig) {
        self.schedules = ScheduleEndpoint(config: config)
        self.sessions = SessionEndpoint(config: config)
    }
}
