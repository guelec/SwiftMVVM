//
//  ViewController.swift
//  GoodWeather
//
//  Created by Yiğit Güleç on 5.07.2021.
//

import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate, SettingsDelegate {
    
    @IBOutlet var rightBarButton: UIBarButtonItem!
    @IBOutlet var leftBarButton: UIBarButtonItem!
    private var weatherListViewModel = WeatherListViewModel()
    private var lastUnitSelection: Unit!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        super.title = "Good Weather"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.register(WeatherCell.self, forCellReuseIdentifier: "WeatherCell")
        
        //var addWeatherVC = AddWeatherViewController()
        AddWeatherViewController.delegate = self
        SettingsViewController().delegate = self
        setupItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupItem() {
        rightBarButton = {
            let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.toAddWeatherViewController))
            navigationItem.rightBarButtonItem = button
            return button
        }()
        
        leftBarButton = {
            let button = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(self.toSettingsViewController))
            navigationItem.leftBarButtonItem = button
            return button
        }()
        
    }
    
    func settingsDone(vm: SettingsViewModel) {
        if lastUnitSelection.rawValue != vm.selecedUnit.rawValue {
            weatherListViewModel.updateUnit(to: vm.selecedUnit)
            tableView.reloadData()
            lastUnitSelection = Unit(rawValue: vm.selecedUnit.rawValue)
        }
    }
 
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
    }
    
    @objc func toAddWeatherViewController() {
        navigationController?.pushViewController(AddWeatherViewController(), animated: true)
    }
    
    @objc func toSettingsViewController() {
        navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    
}

//MARK: - TableView Config

extension WeatherListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        //cell = UITableViewCell(style: .value1, reuseIdentifier: "WeatherCell")
        cell.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        //let weatherVM = weatherListViewModel.modelAt(indexPath.row)
        //let weatherVM = WeatherListViewModel.weatherViewModels[indexPath.row]
        let weatherVM = WeatherListViewModel.weatherViewModels[indexPath.row]
        cell.configure(weatherVM)
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.rowHeight = 120
        
        return cell
    }
    
}
