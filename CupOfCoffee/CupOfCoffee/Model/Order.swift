//
//  Order.swift
//  CupOfCoffee
//
//  Created by Yiğit Güleç on 22.06.2021.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case cappucino
    case latte
    case espresso
    case cortado
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large
}

struct Order: Codable{
    var name: String
    var email: String
    var type: CoffeeType.RawValue
    var size: CoffeeSize.RawValue
}

extension Order {
    
    static var all: Resource<[Order]> = {
        guard let url = URL(string: "https://60d306d0858b410017b2ebbb.mockapi.io/orders") else {
            fatalError("URL is incorrect.")
        }
        return Resource<[Order]>(url: url)
    }()
    
    static func create(_ vm: AddCoffeeOrderViewModel) -> Resource<Order?> {
        
        let order = Order(vm)
        guard let url = URL(string: "https://60d306d0858b410017b2ebbb.mockapi.io/orders") else {
            fatalError("URL is incorrect.")
        }
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error endocing order!")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        
        return resource
    }
}

extension Order {
    init?(_ vm: AddCoffeeOrderViewModel) {
        
        guard let name = vm.name,
              let email = vm.email,
              let selectedType = CoffeeType(rawValue: (vm.selectedType!.lowercased())),
              let selectedSize = CoffeeSize(rawValue: (vm.selectedSize!.lowercased())) else {
            return nil
        }
        self.name = name
        self.email = email
        self.type = selectedType.rawValue
        self.size = selectedSize.rawValue
    }
}

