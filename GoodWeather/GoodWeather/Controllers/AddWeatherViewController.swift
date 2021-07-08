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
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var leftBarButton: UIBarButtonItem!
    @IBOutlet var stackView: UIStackView!
    
    private var addWeatherVM = AddWeatherViewModel()
    static var delegate: AddWeatherDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.title = "Add City"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .white
        
        
        
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        
        textField = {
            let field = UITextField(frame: CGRect(x: 0, y: 0, width: 300.00, height: 30.00))
            field.placeholder = "Enter City Name"
            // below part adds padding to text inside text field
            field.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
            field.borderStyle = .roundedRect
            //field.layer.cornerRadius = 10
            //field.layer.borderWidth = 0.5
            return field
        }()
        
        saveButton = {
            let button = UIButton(type: .roundedRect)
            button.layer.cornerRadius = 5
            button.addTarget(self, action: #selector(self.savePressed), for: .touchUpInside)
            button.setTitle("Save", for: .normal)
            return button
        }()
        
        leftBarButton = {
            let button = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.closePressed))
            self.navigationItem.leftBarButtonItem = button
            return button
        }()
        
        stackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.clipsToBounds = true
            return stack
        }()
        
        view.addSubview(stackView)
        stackView.addSubview(textField)
        stackView.addSubview(saveButton)
        
        textField.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0).isActive = true
        textField.bottomAnchor.constraint(equalTo: textField.bottomAnchor, constant: 0).isActive = true
        textField.leadingAnchor.constraint(equalTo: textField.leadingAnchor, constant: 0).isActive = true
        textField.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 0).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        saveButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20).isActive = true
        saveButton.bottomAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 0).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: saveButton.leadingAnchor, constant: 0).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: saveButton.trailingAnchor, constant: 0).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:0).isActive = true
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:0).isActive = true
        //stackView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0).isActive = true
                stackView.heightAnchor.constraint(equalToConstant:150).isActive = true
        
        
    }
    
    @objc func savePressed() {
        
        if let city = textField.text {
            addWeatherVM.addWeather(for: city) { (vm) in
                AddWeatherViewController.delegate?.addWeatherDidSave(vm: vm)
                WeatherListTableViewController().tableView.reloadData()
                self.navigationController?.popViewController(animated: true)
                
                //self.navigationController?.popToRootViewController(animated: true)
                //self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @objc func closePressed() {
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
