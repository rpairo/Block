//
//  BlockApp.swift
//  Block
//
//  Created by Raúl Pera Pairó on 5/3/22.
//

import SwiftUI

@main
struct BlockApp: App {
    // MARK: Properties
    let coreDataManager = CoreDataManager.shared

    let employeeRepository = EmployeeRepository(
        dataSource: EmployeeAPIDataSource(
            configuration: EmployeeAPIConfigManager()
        ), database: EmployeeDatabaseDatasource()
    )

    // MARK: View
    var body: some Scene {
        WindowGroup {
            EmployeeListView(
                viewModel: EmployeeListViewModel(
                    fetchEmployeeUseCase: FetchEmployeesUseCase(
                        repository: employeeRepository,
                        storeEmployeeUseCase: StoreEmployeeUseCase(
                            repository: employeeRepository
                        )
                    )
                )
            )

            .environment(\.managedObjectContext, coreDataManager.persistentContainer.viewContext)
        }
    }
}
