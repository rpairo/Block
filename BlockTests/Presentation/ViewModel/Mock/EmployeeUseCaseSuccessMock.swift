//
//  EmployeeUseCaseSuccessMock.swift
//  BlockTests
//
//  Created by Raúl Pera Pairó on 8/3/22.
//

import Foundation
@testable import Block

struct EmployeeUseCaseSuccessMock: FetchEmployeeUseCaseable {
    func execute(onComplete: @escaping FetchEmployeeResult) {
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
