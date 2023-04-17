//
//  APIError.swift
//  DeeplinkApp
//
//  Created by Arne Oldenhave on 16/04/2023.
//

import Foundation


extension APIService {
    enum APIError: Error {
        case malformedURL(String)
    }
}
 
