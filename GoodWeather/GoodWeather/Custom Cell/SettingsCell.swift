//
//  SettingsCell.swift
//  GoodWeather
//
//  Created by Yiğit Güleç on 8.07.2021.
//

import Foundation
import UIKit

class SettingsCell: UITableViewCell {
    
    let unitLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 16)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        addSubview(unitLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


