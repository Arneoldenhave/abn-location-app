//
//  UpdateableView.swift
//  DeeplinkApp
//
//  Created by Arne Oldenhave on 16/04/2023.
//

import UIKit

public protocol UpdateableView where Self: UIView {
    associatedtype UpdateData
    func updateUI(with: UpdateData)
}
