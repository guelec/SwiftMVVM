//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Yiğit Güleç on 6.07.2021.
//

import Foundation

class WeatherListViewModel {
    static var weatherViewModels: [WeatherViewModel] = [WeatherViewModel]()
    
    func addWeatherViewModel(_ vm: WeatherViewModel) {
        //print(vm.city)
        WeatherListViewModel.weatherViewModels.append(vm)
        //weatherViewModels.insert(vm, at: weatherViewModels.count)
        //print(WeatherListViewModel.weatherViewModels.count)
    }
    
    func numberOfRows(_ section: Int) -> Int{
        return WeatherListViewModel.weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return WeatherListViewModel.weatherViewModels[index]
    }
    
    private func toCelcius() {
        WeatherListViewModel.weatherViewModels =  WeatherListViewModel.weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature - 32) * 5/9
            return weatherModel
        }
    }
    
    private func toFahrenheit() {
        WeatherListViewModel.weatherViewModels =  WeatherListViewModel.weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature * 9/5) + 32
            return weatherModel
        }
    }
    
    func updateUnit(to unit: Unit) {
        switch (unit) {
        case .celsius:
            toCelcius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
}

class WeatherViewModel {
    
    let weather: WeatherResponse
    var temperature: Double
    
    init(weather: WeatherResponse) {
        self.weather = weather
        temperature = weather.main.temp
    }
    
    var city: String{
        return weather.name
    }
    
}
