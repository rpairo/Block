//
//  ListViewModel.swift
//  Block
//
//  Created by Raúl Pera Pairó on 6/3/22.
//

import Foundation

class ListViewModel: ObservableObject {
    // MARK: Properties
    @Published var employees = [Employee]()
    @Published var error: FetchEmployeeError?

    // MARK: Use cases
    let fetchEmployeeUseCase: FetchEmployeeUseCaseable

    // MARK: Constructor
    init(fetchEmployeeUseCase: FetchEmployeeUseCaseable) {
        self.fetchEmployeeUseCase = fetchEmployeeUseCase
    }

    // MARK: Lifecycle
    func onAppear() {
        self.fetchEmployeeUseCase.execute { result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self.error = error
                }
            case .success(let employees):
                DispatchQueue.main.async {
                    self.employees = employees
                    self.error = nil
                }
            }
        }
    }
}
