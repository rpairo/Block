//
//  ListViewModel.swift
//  Block
//
//  Created by Raúl Pera Pairó on 6/3/22.
//

import Foundation

enum EmployeListState {
    case idle
    case loading
    case loaded
    case error(FetchEmployeeError)
}

class EmployeeListViewModel: ObservableObject {
    // MARK: Properties
    @Published var state: EmployeListState = .idle
    @Published var employees = [Employee]()

    // MARK: Use cases
    private let fetchEmployeeUseCase: FetchEmployeeUseCaseable

    // MARK: Constructor
    init(fetchEmployeeUseCase: FetchEmployeeUseCaseable) {
        self.fetchEmployeeUseCase = fetchEmployeeUseCase
    }

    // MARK: Lifecycle
    func onAppear(onLoad: @escaping () -> Void) {
        self.state = .loading
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
                    self?.state = .error(error)
                    onComplete?(.failure(error))
                }
            case .success(let employees):
                DispatchQueue.main.async {
                    self?.employees = employees
                    self?.state = .loaded
                    onComplete?(.success(employees))
                }
            }
        }
    }
}
