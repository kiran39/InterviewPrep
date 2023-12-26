//
//  ViewController.swift
//  CoredataSample
//
//  Created by Kiran Kumar on 13/12/23.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var emailTextfField: UITextField!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var departmentTextField: UITextField!
    
    private let manager = DatabaseManager() 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func createBtnAction(_ sender: Any) {
        guard let name = nameTextfield.text else {
            return
        }
        guard let age = ageTextField.text else {
            return
        }
        guard let email = emailTextfField.text else {
            return
        }
        guard let department = departmentTextField.text else {
            return
        }
        let employee = EmployeeModel(name: name, age: age, email: email, department: department)
        manager.addEmployee(employee)
        showAlert()
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "User Added", message: "Success", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default) { [weak self] _ in
            self?.nameTextfield.text = ""
            self?.ageTextField.text = ""
            self?.emailTextfField.text = ""
            self?.departmentTextField.text = ""
        }
        alertController.addAction(okayAction)
        present(alertController, animated: true)
    }
}

