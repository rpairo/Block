//
//  EmployeeRepository.swift
//  Block
//
//  Created by Raúl Pera Pairó on 5/3/22.
//

import Foundation

struct EmployeeRepository: EmployeeRepositable {
    // MARK: Properties
    private let dataSource: EmployeeDataSourceable
    private let database: EmployeeDatabaseable

    // MARK: Constructos
    init(dataSource: EmployeeDataSourceable, database: EmployeeDatabaseable) {
        self.dataSource = dataSource
        self.database = database
    }

    // MARK: Functionality
    func fetch(onComplete: @escaping FetchEmployeeResult) {
        dataSource.fetch(onComplete: onComplete)
    }

    func store(onComplete: @escaping StoreEmployeeResult, employees: [Employee]) {
        database.store(onComplete: onComplete, employees: employees)
    }
}
