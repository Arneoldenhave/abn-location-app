//
//  UIVIew.swift
//  DeeplinkApp
//
//  Created by Arne Oldenhave on 16/04/2023.
//

import UIKit


public extension UIView {
    
    @discardableResult
    func wrap(_ view: UIView,  insets: UIEdgeInsets = .zero, postion: Int? = nil) -> [NSLayoutConstraint] {
        view.translatesAutoresizingMaskIntoConstraints = false
        if let postion {
            self.insertSubview(view, at: postion)
        } else {
            self.addSubview(view)
        }
        let constraints : [NSLayoutConstraint] = [
            view.topAnchor.constraint(equalTo: self.topAnchor, constant: insets.top),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor,  constant: insets.left),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: insets.bottom),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: insets.right)
        ]
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
}
