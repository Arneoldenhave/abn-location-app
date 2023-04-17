//
//  TableViewCell.swift
//  DeeplinkApp
//
//  Created by Arne Oldenhave on 16/04/2023.
//

import UIKit

extension UIComponents {
    
    public final class TableViewCell<View: UIView>: UITableViewCell  {
        
        public let view: View
    
        let  l = UILabel()
        
        
         override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
             self.view = View()
             super.init(style: style, reuseIdentifier: reuseIdentifier)
             contentView.wrap(view)
         }

         required init?(coder aDecoder: NSCoder) {
             fatalError("init(coder:) has not been implemented")
         }
    }
}
