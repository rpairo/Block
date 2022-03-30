//
//  RetrieveEmployeesUseCase.swift
//  Block
//
//  Created by Raúl Pera Pairó on 30/3/22.
//

import Foundation

struct RetrieveEmployeesUseCase: RetrieveEmployeesUseCaseable {
    // MARK: Properties
    private let repository: EmployeeRepositable

    // MARK: Constructor
    init(repository: EmployeeRepositable) {
        self.repository = repository
    }

    // MARK: Functionality
    func execute(onComplete: @escaping RetrieveEmployeeResult, employees: [Employee]) {
        repository.retrieve(onComplete: onComplete)
    }
}
