//
//  JolpicaKit.swift
//  JolpicaKit
//
//  Created by Gordon on 06.02.2025.
//

import Foundation

public enum Result<T> {
    case success(_ response: T)
    case failure(_ err: String)
}

final class Jolpica: Sendable {
    private let enableLogging: Bool
    
    init(enableLogging: Bool = false) {
        self.enableLogging = enableLogging
    }
    
    internal func formRequest(season: String?, round: String?, endpoint: String, filters: [String]) -> URLRequest {
        let url = URL(string: "")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return request
    }
    
    internal func request<T: Decodable>(request: URLRequest, decode: T.Type) async -> Result<T> {
        if enableLogging {
            print("[Jolpica] \(request.httpMethod!) \(request.url?.absoluteString ?? "")")
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure("") // TODO
            }
            
            if enableLogging {
                print("[Jolpica] response code: \(httpResponse.statusCode)")
            }
            
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
            
            return .success(try decoder.decode(T.self, from: data))
        } catch {
            if enableLogging {
                print("[Jolpica] failed parsing successful response, error: \(error.localizedDescription)")
            }
            
            return .failure("Failed to parse response")
        }
    }
    
    private func parseError<T>(response: HTTPURLResponse) -> Result<T> {
        // TODO implement error parsing
        
        return .failure("TEMP Error")
    }
}
