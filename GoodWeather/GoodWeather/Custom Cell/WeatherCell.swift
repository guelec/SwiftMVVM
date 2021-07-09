//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Yiğit Güleç on 6.07.2021.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    let cityNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 32)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let temperatureLabel: UILabel = {
       let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 36)
        label.textAlignment = .right
        return label
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.clipsToBounds = true
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(stackView)
        stackView.addSubview(cityNameLabel)
        stackView.addSubview(temperatureLabel)
        
        cityNameLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0).isActive = true
        cityNameLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0).isActive = true
        cityNameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 15).isActive = true
        cityNameLabel.trailingAnchor.constraint(equalTo: cityNameLabel.trailingAnchor, constant: 0).isActive = true
        cityNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.65).isActive = true
        cityNameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1.0).isActive = true
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        temperatureLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0).isActive = true
        temperatureLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0).isActive = true
        temperatureLabel.leadingAnchor.constraint(equalTo: temperatureLabel.leadingAnchor, constant: 0).isActive = true
        temperatureLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -15).isActive = true
        temperatureLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2).isActive = true
        temperatureLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1.0).isActive = true
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.textAlignment = .right
        
        //stackView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
                stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
                stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
                stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
                stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
                //stackView.heightAnchor.constraint(equalToConstant:70).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ vm: WeatherViewModel) {
        self.cityNameLabel.text = vm.city
        switch SettingsViewModel().selecedUnit.displayName {
        case "Celcius":
            self.temperatureLabel.text = ("\(Int.init(vm.temperature.rounded(.down)) )°C")
        case "Fahrenheit":
            self.temperatureLabel.text = ("\(Int.init(vm.temperature.rounded(.down)) )°F")
        default:
            self.temperatureLabel.text = ("\(Int.init(vm.temperature.rounded(.down)) )°")
        }
        
    }
    
}

