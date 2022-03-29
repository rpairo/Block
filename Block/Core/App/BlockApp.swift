//
//  BlockApp.swift
//  Block
//
//  Created by Raúl Pera Pairó on 5/3/22.
//

import SwiftUI

@main
struct BlockApp: App {
    var body: some Scene {
        WindowGroup {
            EmployeeListView(
                viewModel: EmployeeListViewModel(
                    fetchEmployeeUseCase: FetchEmployeesUseCase(
                        repository: EmployeeRepository(
                            dataSource: EmployeeAPIDataSource(
                                configuration: EmployeeAPIConfigManager()
                            ), database: EmployeeDatabaseDatasource()
                        )
                    )
                )
            )
        }
    }
}
