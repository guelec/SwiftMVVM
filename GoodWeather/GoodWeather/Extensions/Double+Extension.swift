//
//  Double+Extension.swift
//  GoodWeather
//
//  Created by Yiğit Güleç on 7.07.2021.
//

import Foundation

extension Double {
    
    func formatAsDegree() -> String {
        return String(format: ".0f°", self)
    }
    
}
