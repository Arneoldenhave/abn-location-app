//
//  APIService.swift
//  DeeplinkApp
//
//  Created by Arne Oldenhave on 16/04/2023.
//

import Foundation

public final class APIService {
    
    public static let shared = APIService()
    
    private init() {}
    
}

// API
extension APIService {
    public func getLocations() async throws -> [APIV1Location] {
        let url = "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json"
        return try await GETRequest<APIV1GETLocationsResponse>(url: url).execute().locations
    }
}

