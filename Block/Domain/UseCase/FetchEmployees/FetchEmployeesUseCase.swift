//
//  FetchEmployeesUseCase.swift
//  Block
//
//  Created by Raúl Pera Pairó on 6/3/22.
//

import Foundation
import Network

struct FetchEmployeesUseCase: FetchEmployeeUseCaseable {
    // MARK: Properties
    private let repository: EmployeeRepositable
    private let storeEmployeeUseCase: StoreEmployeeUseCaseable

    // MARK: Constructor
    init(repository: EmployeeRepositable, storeEmployeeUseCase: StoreEmployeeUseCaseable) {
        self.repository = repository
        self.storeEmployeeUseCase = storeEmployeeUseCase
    }

    // MARK: Functionality
    func execute(onComplete: @escaping FetchEmployeeResult) {
        isNetworkAvailable { result in
            if result {
                repository.fetch { result in
                    switch result {
                    case .success(let employees):
                        storeEmployees(employees)
                        onComplete(.success(employees))
                    case .failure(let error):
                        onComplete(.failure(error))
                    }
                }
            } else {
                repository.retrieve { result in
                    switch result {
                    case .success(let employees):
                        onComplete(.success(employees))
                    case .failure:
                        onComplete(.failure(.emptyList))
                    }
                }
            }
        }
    }

    private func storeEmployees(_ employees: [Employee]) {
        self.storeEmployeeUseCase.execute(onComplete: { result in
            switch result {
            case .success(let employees):
                NSLog("Storage of employees succesful: \(employees)")
            case .failure(let error):
                NSLog("Error storaging employees: \(error)")
            }
        }, employees: employees)
    }

    private func isNetworkAvailable(onComplete: @escaping (Bool) -> Void) {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "InternetConnectionMonitor")

        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                onComplete(true)
            } else {
                onComplete(false)
            }
        }

        monitor.start(queue: queue)
    }
}
