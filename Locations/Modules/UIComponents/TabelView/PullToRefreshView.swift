//
//  PullToRefreshView.swift
//  Locations
//
//  Created by Arne Oldenhave on 17/04/2023.
//

import UIKit


extension UIComponents {
    
    public final class PullToRefreshView: UIView {
        
        private let label = UILabel()
        private let stack = UIStackView()
        
        override public init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
}

extension UIComponents.PullToRefreshView {
        
    func commonInit() {
        self.label.text = " 👆 Pull to refresh"
        self.wrap(stack)
        stack.addArrangedSubview(label)
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.axis = .vertical
    }

}
