//
//  Constants.swift
//  GoodWeather
//
//  Created by Yiğit Güleç on 6.07.2021.
//

import Foundation

struct Constants{
    
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL {
            
            //let userDefaults = UserDefaults.standard
            //let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=8e1ca15fdf0c3f386302d5dd61ea81b4&units=imperial")!
            
        }
        
    }
    
}
