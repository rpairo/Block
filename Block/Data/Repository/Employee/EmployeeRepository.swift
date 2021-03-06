//
//  EmployeeRepository.swift
//  Block
//
//  Created by Raúl Pera Pairó on 5/3/22.
//

import Foundation

struct EmployeeRepository: EmployeeRepositable {
    // MARK: Properties
    private let dataSource: EmployeeDataSourceable

    // MARK: Constructos
    init(dataSource: EmployeeDataSourceable) {
        self.dataSource = dataSource
    }

    // MARK: Functionality
    func fetch(onComplete: @escaping FetchEmployeeResult) {
        dataSource.fetch(onComplete: onComplete)
    }
}
