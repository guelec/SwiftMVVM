//
//  AddOrderViewController.swift
//  CupOfCoffee
//
//  Created by Yiğit Güleç on 21.06.2021.
//

import UIKit

protocol AddCoffeeOrderDelegate {
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController)
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController)
}

class AddOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var delegate: AddCoffeeOrderDelegate?
    
    var vm = AddCoffeeOrderViewModel()
    @IBOutlet var tableView: UITableView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var rightBarButton: UIBarButtonItem!
    @IBOutlet var leftBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        super.title = "Add New Order"
        
        tableView = {
            let tableView = UITableView()
            view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CoffeeTypeTableViewCell")
            return tableView
        }()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        segmentedControl = {
            let segmentItems = self.vm.sizes
            let segmentedControl = UISegmentedControl(items: segmentItems)
            segmentedControl.tintColor = .blue
            segmentedControl.selectedSegmentIndex = 1
            view.addSubview(segmentedControl)
            segmentedControl.frame = CGRect(x: view.frame.width * 0.25, y: 500, width: (self.view.frame.width * 0.5), height: 30)
            return segmentedControl
        }()
        
        nameTextField = {
            let textField = UITextField()
            view.addSubview(textField)
            textField.placeholder = "Enter Name"
            textField.borderStyle = .roundedRect
            textField.frame = CGRect(x: view.frame.width * 0.25, y: 600, width: (self.view.frame.width * 0.5), height: 30)
            return textField
        }()
        
        emailTextField = {
            let textField = UITextField()
            view.addSubview(textField)
            textField.placeholder = "Enter Email"
            textField.borderStyle = .roundedRect
            textField.frame = CGRect(x: view.frame.width * 0.25, y: 650, width: (self.view.frame.width * 0.5), height: 30)
            return textField
        }()
        
        rightBarButton = {
            let item = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.save))
            self.navigationItem.rightBarButtonItem = item
            return item
        }()
        
        leftBarButton = {
            let item = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.close))
            self.navigationItem.leftBarButtonItem = item
            return item
        }()
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTypeTableViewCell", for: indexPath)
        cell.textLabel?.text = self.vm.types[indexPath.row]
        return cell 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    @objc func close(sender: UIButton!) {
        navigationController?.popViewController(animated: true)
        /*
        if let delegate = self.delegate {
            delegate.addCoffeeOrderViewControllerDidClose(controller: self)
            //navigationController?.popViewController(animated: true)
        }
         */
    }
    
    @objc func save(sender: UIButton!) {
        
        let name = self.nameTextField.text
        let email = self.emailTextField.text
        let selectedSize = self.segmentedControl.titleForSegment(at: self.segmentedControl.selectedSegmentIndex)
        
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("Error in selecting coffee")
        }
        
        self.vm.name = name
        self.vm.email = email
        self.vm.selectedSize = selectedSize
        self.vm.selectedType = self.vm.types[indexPath.row]
        
        WebService().load(resource: Order.create(self.vm)) { result in
            switch result {
            case .success(let order):
                self.delegate = OrdersTableViewController()
                if let delegate = self.delegate {
                    DispatchQueue.main.async {
                        delegate.addCoffeeOrderViewControllerDidSave(order: order!, controller: self)
                    }
                }
                
                
                print(order)
            case .failure(let error):
                print(error)
            }
        }
        
        // navigationController?.popViewController(animated: true)
        
    }
    
}
