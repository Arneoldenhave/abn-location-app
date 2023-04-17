//
//  LocationsModel.swift
//  DeeplinkApp
//
//  Created by Arne Oldenhave on 16/04/2023.
//

import Foundation
import CoreLocation

public struct Location {
    let name: String?
    let location: CLLocation
}

public extension Location {
     init(from apiV1Location: APIV1Location) {
        self.name = apiV1Location.name
        self.location = .init(latitude: apiV1Location.lat, longitude: apiV1Location.long)
    }
}
