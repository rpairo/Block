//
//  EmployeeDatabaseable.swift
//  Block
//
//  Created by Raúl Pera Pairó on 29/3/22.
//

import Foundation

protocol EmployeeDatabaseable {
    // MARK: Functionality
    func store(onComplete: @escaping StoreEmployeeResult, employees: [Employee])
    func retrieve(onComplete: @escaping RetrieveEmployeeResult)
}
