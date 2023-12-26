//
//  DatabaseManager.swift
//  CoredataSample
//
//  Created by Kiran Kumar on 14/12/23.
//

import UIKit
import CoreData

class DatabaseManager {
    private var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func addEmployee(_ employee: EmployeeModel) {
        let employeeEntity = Employee(context: context)
        employeeEntity.name = employee.name
        employeeEntity.age = employee.age
        employeeEntity.email = employee.email
        employeeEntity.department = employee.department
        do {
            try context.save()
        } catch {
            print("Unable to save employee:", error)
        }
    }
    
    func fetchEmployee() -> [Employee] {
        var employeesArray: [Employee] = []
        
        do {
            employeesArray = try context.fetch(Employee.fetchRequest())
        }catch {
            print("Unable to fetch request:", error)
        }
        return employeesArray
    }
}
