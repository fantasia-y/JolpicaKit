//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 10.02.2025.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
import Logging

public enum Result<T: Sendable>: Sendable {
    case success(_ response: T)
    case failure(_ err: String)
}

public enum Endpoint: String {
    case schedules = "schedules"
    case sessions = "sessions"
}

public struct JolpicaRequest {
    let endpoint: Endpoint
    let query: [String: String]?
    let path: [String]?
    
    init(endpoint: Endpoint, query: [String: String]? = nil, path: [String]? = nil) {
        self.endpoint = endpoint
        self.query = query
        self.path = path
    }
}

public class JolpicaEndpoint {
    private let config: JolpicaConfig
    
    init(config: JolpicaConfig) {
        self.config = config
    }
    
    private func log(_ message: String, _ level: Logger.Level = .info) {
        if config.enableLogging {
            logger.log(level: level, "\(message)")
        }
    }
    
    internal func execute<T: Decodable>(_ request: JolpicaRequest) async -> Result<T> {
        let req = self.formRequest(request)
        
        return await self.request(request: req, decode: T.self)
    }
    
    private func formRequest(_ request: JolpicaRequest) -> URLRequest {
        var baseURL = self.config.baseURL
        
        baseURL += "/\(request.endpoint)"
        
        if let path = request.path, !path.isEmpty {
            baseURL += "/\(path.joined(separator: "/"))"
        }
        
        var components = URLComponents(string: baseURL)!
        
        var queryItems = [URLQueryItem]()
        for (name, value) in request.query ?? [:] {
            queryItems.append(.init(name: name, value: value))
        }
        components.queryItems = queryItems
        
        let url = components.url!
        var request = URLRequest(url: url)
        
        request.cachePolicy = config.cachePolicy
        
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
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            
            decoder.dateDecodingStrategy = .formatted(formatter)
            
            let result = try decoder.decode([String: T].self, from: data)
            
            if let resultData = result.first {
                return .success(resultData.value)
            } else {
                log("failed parsing response, root key \"MRData\" not present", .error)
                
                return .failure("Failed to parse response")
            }
        } catch {
            log("failed parsing successful response, error: \(error.localizedDescription)", .error)
            
            return .failure("Failed to parse response")
        }
    }
    
    private func parseError<T>(response: HTTPURLResponse) -> Result<T> {
        // TODO implement error parsing
        // 429 rate limit
        
        return .failure("TEMP Error")
    }
}
