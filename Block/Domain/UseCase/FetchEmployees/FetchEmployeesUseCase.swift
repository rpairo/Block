//
//  FetchEmployeesUseCase.swift
//  Block
//
//  Created by Raúl Pera Pairó on 6/3/22.
//

import Foundation

struct FetchEmployeesUseCase: FetchEmployeeUseCaseable {
    // MARK: Properties
    private let repository: EmployeeRepositable

    // MARK: Constructor
    init(repository: EmployeeRepositable) {
        self.repository = repository
    }

    // MARK: Functionality
    func execute(onComplete: @escaping FetchEmployeeResult) {
        repository.fetch(onComplete: onComplete)
    }
}
