//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 07.02.2025.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

extension HTTPURLResponse {
    func isSuccessful() -> Bool {
        return statusCode >= 200 && statusCode <= 299
    }
}
