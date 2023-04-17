//
//  LocationsListView.swift
//  DeeplinkApp
//
//  Created by Arne Oldenhave on 16/04/2023.
//

import UIKit

public final class LocationsListView: UIView {
    
    private let label: UILabel = .init()
    private let stackView = UIStackView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LocationsListView {
    
    func commonInit() {
        let inset: CGFloat = 10
        self.wrap(stackView, insets: .init(top: inset, left: inset, bottom: inset, right: inset))
        stackView.axis = .horizontal
        stackView.addArrangedSubview(label)
    }
}


extension LocationsListView: UpdateableView {
    public func updateUI(with data: UpdateData) {
        self.label.text = data.locationName
    }
    
    public struct UpdateData {
        let locationName: String?
        
        public init(from location: Location) {
            self.locationName = location.name
        }
    }
    
}
