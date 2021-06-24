//
//  ViewController.swift
//  CupOfCoffee
//
//  Created by Yiğit Güleç on 21.06.2021.
//

import UIKit

class OrdersTableViewController: UITableViewController, AddCoffeeOrderDelegate {
    var orderListViewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.title = "Orders"
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.onTap))
        self.navigationItem.rightBarButtonItem = button
        
        populateOrders()

    }
    
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController) {
        controller.navigationController?.popViewController(animated: true)
        let orderVM = OrderViewModel(order: order)
        self.orderListViewModel.ordersViewModel.append(orderVM)
        self.tableView.insertRows(at: [IndexPath.init(row: self.orderListViewModel.ordersViewModel.count - 1, section: 0)], with: .automatic)
    }
    
    private func populateOrders(){
        
        WebService().load(resource: Order.all) { [weak self] result in
            switch result {
            case .success(let orders):
                self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.ordersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.textLabel?.text = vm.type
        cell.detailTextLabel?.text = vm.size
        return cell
        
    }
    
    @objc func onTap(){
        navigationController?.pushViewController(AddOrderViewController(), animated: true)
        let vc = AddOrderViewController()
        vc.delegate = self
    }
    
}
