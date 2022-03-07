//
//  EmployeeAPIDataSourceSuccessMock.swift
//  BlockTests
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import Foundation
@testable import Block

struct EmployeeAPIDataSourceSuccessMock: EmployeeDataSourceable {
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
