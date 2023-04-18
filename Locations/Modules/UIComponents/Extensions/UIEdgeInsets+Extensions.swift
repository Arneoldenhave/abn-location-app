//
//  UIEdgeInsets.swift
//  Locations
//
//  Created by Arne Oldenhave on 17/04/2023.
//

import UIKit


public extension UIEdgeInsets {
    
    public static func equal(_ float: CGFloat) -> Self {
        .init(top: float, left: float, bottom: -float, right: -float)
    }
}
