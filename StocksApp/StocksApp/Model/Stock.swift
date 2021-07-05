//
//  Stock.swift
//  StocksApp
//
//  Created by Yiğit Güleç on 5.07.2021.
//

import Foundation

struct Stock: Decodable {
    let symbol : String
    let description: String
    let price: Double
    let change: String
}
