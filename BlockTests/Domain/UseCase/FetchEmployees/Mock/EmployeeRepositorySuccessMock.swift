//
//  EmployeeRepositorySuccessMock.swift
//  BlockTests
//
//  Created by Raúl Pera Pairó on 8/3/22.
//

import Foundation
@testable import Block

struct EmployeeRepositorySuccessMock: EmployeeRepositable {
    func fetch(onComplete: @escaping FetchEmployeeResult) {
        let employeesMock = [
            Employee(
                id: "",
                name: "",
                phone: "",
                email: "",
                biography: "",
                smallPhoto: "",
                largePhoto: "",
                team: "",
                employeeType: ""
            )
        ]
        onComplete(.success(employeesMock))
    }
}
