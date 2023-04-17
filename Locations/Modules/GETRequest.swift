//
//  Request.swift
//  DeeplinkApp
//
//  Created by Arne Oldenhave on 16/04/2023.
//

import Foundation

extension APIService {
    
    struct GETRequest<Response: Decodable> {
        
        public let url : URL
        
        public init(url: URL) {
            self.url = url
        }
        
        public init(url: String) throws {
            guard let url = URL(string: url) else { throw APIError.malformedURL(url) }
            self.url = url
        }
        
        public func execute() async throws -> Response {
            let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
            let decoder = JSONDecoder()
            let getLocationsResponse = try decoder.decode(Response.self, from: data)
            return getLocationsResponse
        }
    }
}

