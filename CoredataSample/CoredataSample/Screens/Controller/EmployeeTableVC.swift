//
//  EmployeeTableVC.swift
//  CoredataSample
//
//  Created by Kiran Kumar on 14/12/23.
//

import UIKit

class EmployeeTableVC: UIViewController {
    @IBOutlet weak var employeeTableView: UITableView!
    
    private var employeesArray:[Employee] = []
    private let manager = DatabaseManager()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        employeesArray = manager.fetchEmployee()
        employeeTableView.reloadData()
    }
    @IBAction func addAction(_ sender: Any) {
        guard let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as? ViewController else { return }
        navigationController?.pushViewController(registerVC, animated: true)
    }

}
extension EmployeeTableVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = employeeTableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        let employee = employeesArray[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = employee.name
        content.secondaryText = employee.department
        cell.contentConfiguration = content
        return cell
    }
    
}
