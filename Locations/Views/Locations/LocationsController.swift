//
//  LocationsController.swift
//  DeeplinkApp
//
//  Created by Arne Oldenhave on 16/04/2023.
//

import Foundation

public final class LocationsController {
    
    private let apiService : APIService
        
    public init (apiService: APIService = .shared) {
        self.apiService = apiService
    }
    
    public func getLocations() async throws -> [Location] {
        return try await apiService.getLocations().map { Location(from: $0) }
    }
}

