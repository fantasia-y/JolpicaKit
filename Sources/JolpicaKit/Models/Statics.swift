//
//  Statics.swift
//  JolpicaKit
//
//  Created by Gordon on 05.02.2025.
//

import Foundation

public struct DetailMetadata: Decodable, Sendable, Hashable {
    public let timestamp: String
}

public struct PaginationMetadata: Decodable, Sendable, Hashable {
    public let timestamp: String
    public let count: Int
    public let page_size: Int
    public let current_page: Int
    public let total_pages: Int
    public let next_url: String?
    public let previous_url: String?
}
