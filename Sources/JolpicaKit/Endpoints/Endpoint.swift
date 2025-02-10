//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation
import os

public enum Result<T: Sendable>: Sendable {
    case success(_ response: T)
    case failure(_ err: String)
}

public enum Endpoint: String {
    case circuits = "circuits"
    case constructors = "constructors"
    case drivers = "drivers"
    case fastest = "fastest"
    case grid = "grid"
    case seasons = "seasons"
    case races = "races"
    case constructorstandings = "constructorstandings"
    case driverstandings = "driverstandings"
    case status = "status"
    case laps = "laps"
    case pitstops = "pitstops"
    case qualifying = "qualifying"
    case results = "results"
    case sprints = "sprint"
}

public struct JolpicaRequest {
    let endpoint: Endpoint
    let season: String?
    let round: String?
    let filters: [String]
    
    init(endpoint: Endpoint, season: String? = nil, round: String? = nil, filters: [String] = []) {
        self.endpoint = endpoint
        self.season = season
        self.round = round
        self.filters = filters
    }
}

public class JolpicaEndpoint {
    private let config: JolpicaConfig
    
    init(config: JolpicaConfig) {
        self.config = config
    }
    
    private func log(_ message: String) {
        if config.enableLogging {
            if #available(iOS 14.0, OSX 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *) {
                logger.log("[JolpicaKit] \(message)")
            } else {
                print("[JolpicaKit] \(message)")
            }
        }
    }
    
    internal func execute<T: Decodable>(_ request: JolpicaRequest) async -> Result<T> {
        let req = self.formRequest(season: request.season, round: request.round, endpoint: request.endpoint.rawValue, filters: request.filters)
        
        return await self.request(request: req, decode: T.self)
    }
    
    private func formRequest(season: String?, round: String?, endpoint: String, filters: [String]) -> URLRequest {
        var baseURL = self.config.baseURL
        
        if let season {
            baseURL += "/\(season)"
        }
        
        if let round {
            baseURL += "/\(round)"
        }
        
        baseURL += "/\(endpoint)"
        
        if !filters.isEmpty {
            baseURL += "/\(filters.joined(separator: "/"))"
        }
        
        baseURL += ".json"
        
        let url = URL(string: baseURL)!
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return request
    }
    
    private func request<T: Decodable>(request: URLRequest, decode: T.Type) async -> Result<T> {
        log("\(request.httpMethod!) \(request.url?.absoluteString ?? "")")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure("") // TODO
            }
            
            log("response code: \(httpResponse.statusCode)")
            
            if httpResponse.isSuccessful() {
                return self.parseResponse(data: data)
            } else {
                return self.parseError(response: httpResponse)
            }
        } catch {
            return .failure(error.localizedDescription)
        }
    }
    
    private func parseResponse<T: Decodable>(data: Data) -> Result<T> {
        do {
            let decoder = JSONDecoder()
            
            let result = try decoder.decode([String: T].self, from: data)
            
            if let resultData = result.first {
                return .success(resultData.value)
            } else {
                return .failure("failed parsing response, root key \"MRData\" not present")
            }
        } catch {
            log("failed parsing successful response, error: \(error.localizedDescription)")
            
            return .failure("Failed to parse response")
        }
    }
    
    private func parseError<T>(response: HTTPURLResponse) -> Result<T> {
        // TODO implement error parsing
        // 429 rate limit
        
        return .failure("TEMP Error")
    }
}
