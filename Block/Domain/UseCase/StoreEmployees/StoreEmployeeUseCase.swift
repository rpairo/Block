//
//  StoreEmployeeUseCase.swift
//  Block
//
//  Created by Raúl Pera Pairó on 29/3/22.
//

import Foundation

struct StoreEmployeeUseCase: StoreEmployeeUseCaseable {
    // MARK: Properties
    private let repository: EmployeeRepositable

    // MARK: Constructor
    init(repository: EmployeeRepositable) {
        self.repository = repository
    }

    // MARK: Functionality
    func execute(onComplete: @escaping StoreEmployeeResult, employees: [Employee]) {
        repository.store(onComplete: onComplete, employees: employees)
    }
}
