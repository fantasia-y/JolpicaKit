//
//  File.swift
//  JolpicaKit
//
//  Created by Gordon on 07.02.2025.
//

import Foundation

extension HTTPURLResponse {
    func isSuccessful() -> Bool {
        return statusCode >= 200 && statusCode <= 299
    }
}
