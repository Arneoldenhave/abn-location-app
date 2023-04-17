//
//  UIVIew.swift
//  DeeplinkApp
//
//  Created by Arne Oldenhave on 16/04/2023.
//

import UIKit


public extension UIView {
    
    @discardableResult
        public func centerIn(_ view: UIView, insets: UIEdgeInsets = .zero) -> [NSLayoutConstraint] {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraints : [NSLayoutConstraint] = [
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor,  constant: insets.left),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: insets.right)
        ]
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
    
}


public extension UIView {
    
    
}
