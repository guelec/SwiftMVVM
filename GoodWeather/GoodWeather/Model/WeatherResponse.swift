//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by Yiğit Güleç on 6.07.2021.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
