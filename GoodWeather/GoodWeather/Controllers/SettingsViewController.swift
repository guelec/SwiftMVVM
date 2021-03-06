//
//  SettingsViewController.swift
//  GoodWeather
//
//  Created by Yiğit Güleç on 5.07.2021.
//

import UIKit

protocol SettingsDelegate {
    func settingsDone(vm: SettingsViewModel)
}

class SettingsViewController: UITableViewController {

    @IBOutlet var rightBarButton: UIBarButtonItem!
    private var settingsViewModel = SettingsViewModel()
    private var weatherListViewModel = WeatherListViewModel()
    var delegate: SettingsDelegate?
    let defaultUnit = UserDefaults.standard
    var defVal: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.title = "Settings"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.hidesBackButton = true
        tableView.register(SettingsCell.self, forCellReuseIdentifier: "SettingsCell")
        defVal = defaultUnit.value(forKey: "unit") as! String
        // print(defaultUnit.value(forKey: "unit"))
        //let defaultUnit = tableVie
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        
        rightBarButton = {
            let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.donePressed))
            self.navigationItem.rightBarButtonItem = button
            return button
        }()
        
    }
    
    @objc func donePressed() {
        
        if defVal == "imperial" && settingsViewModel.selecedUnit.displayName == "Celcius" {
            WeatherListViewModel().toCelcius()
            settingsViewModel.selecedUnit = .celsius
            //defaultUnit.setValue("celcius", forKey: "unit")
        } else if settingsViewModel.selecedUnit.displayName == "Fahrenheit" && defVal == "metric" {
            WeatherListViewModel().toFahrenheit()
            settingsViewModel.selecedUnit = .fahrenheit
            //defaultUnit.setValue("fahrenheit", forKey: "unit")
        }
        
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - TableView Config

extension SettingsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        // uncheck all cells
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            settingsViewModel.selecedUnit = unit
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsItem = settingsViewModel.units[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for:  indexPath)
        cell.textLabel?.text = settingsItem.displayName
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        
        if settingsItem == settingsViewModel.selecedUnit {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
}
