//
//  AddCoffeeOrderViewModel.swift
//  CupOfCoffee
//
//  Created by Yiğit Güleç on 24.06.2021.
//

import Foundation

struct AddCoffeeOrderViewModel {
    var name: String?
    var email:String?
    
    var selectedType: String?
    var selectedSize: String?
    
    var types:[String] {
        return CoffeeType.allCases.map { $0.rawValue.capitalized }
    }
    var sizes:[String] {
        return CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }
    
}
