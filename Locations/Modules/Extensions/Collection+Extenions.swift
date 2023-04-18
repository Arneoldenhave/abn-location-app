//
//  Collection+extenions.swift
//  Locations
//
//  Created by Arne Oldenhave on 17/04/2023.
//

import Foundation

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
