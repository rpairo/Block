//
//  ListViewModel.swift
//  Block
//
//  Created by Raúl Pera Pairó on 6/3/22.
//

import Foundation

class EmployeeListViewModel: ObservableObject {
    // MARK: Properties
    @Published var employees = [Employee]()
    @Published var error: FetchEmployeeError?

    // MARK: Use cases
    private let fetchEmployeeUseCase: FetchEmployeeUseCaseable

    // MARK: Constructor
    init(fetchEmployeeUseCase: FetchEmployeeUseCaseable) {
        self.fetchEmployeeUseCase = fetchEmployeeUseCase
    }

    // MARK: Lifecycle
    func onAppear(onLoad: @escaping () -> Void) {
        fetchEmployees { _ in
            onLoad()
        }
    }

    func onRefresh(onRefreshed: @escaping () -> Void) {
        fetchEmployees { _ in
            onRefreshed()
        }
    }

    // MARK: Functionality
    func fetchEmployees(onComplete: FetchEmployeeResult? = nil) {
        self.fetchEmployeeUseCase.execute { [weak self] result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.error = error
                    onComplete?(.failure(error))
                }
            case .success(let employees):
                DispatchQueue.main.async {
                    self?.error = nil
                    self?.employees = employees
                    onComplete?(.success(employees))
                }
            }
        }
    }
}
