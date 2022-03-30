//
//  EmployeeDatabaseDataSource.swift
//  Block
//
//  Created by Raúl Pera Pairó on 29/3/22.
//

import Foundation
import CoreData

struct EmployeeDatabaseDatasource: EmployeeDatabaseable {
    // MARK: Functionality
    func store(onComplete: @escaping StoreEmployeeResult, employees: [Employee]) {
        do {
            // Store all employees
            for employee in employees {
                try CoreDataManager.shared.saveMovie(employee: employee)
            }
            onComplete(.success(employees))
        } catch {
            onComplete(.failure(.data))
        }
    }

    func retrieve(onComplete: @escaping RetrieveEmployeeResult) {
        do {
            let employees = try CoreDataManager.shared.getAllEmployees()
            onComplete(.success(employees))
        } catch {
            onComplete(.failure(.emptyList))
        }
    }
}
