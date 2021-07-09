//
//  AddWeatherViewController.swift
//  GoodWeather
//
//  Created by Yiğit Güleç on 5.07.2021.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherViewController: UIViewController {
    
    private var addWeatherVM = AddWeatherViewModel()
    static var delegate: AddWeatherDelegate?
    
    var addWeatherView: AddWeatherView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.title = "Add City"
        self.navigationItem.hidesBackButton = true
    }
    
    override func loadView() {
        addWeatherView = AddWeatherView()
        view = addWeatherView
        self.navigationItem.leftBarButtonItem = addWeatherView.leftBarButton
    }
}

//MARK: - Button Interactions

extension AddWeatherViewController {
    @objc func savePressed() {
        if let city = addWeatherView.textField.text {
            addWeatherVM.addWeather(for: city) { (vm) in
                AddWeatherViewController.delegate?.addWeatherDidSave(vm: vm)
                WeatherListTableViewController().tableView.reloadData()
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @objc func closePressed() {
        self.navigationController?.popViewController(animated: true)
    }
}
