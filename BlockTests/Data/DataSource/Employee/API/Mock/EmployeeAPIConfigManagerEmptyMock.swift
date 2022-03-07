//
//  EmployeeAPIConfigManagerEmptyMock.swift
//  BlockTests
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import Foundation
@testable import Block

struct EmployeeAPIConfigManagerEmptyMock: APIConfigurable {
    func buildUrl(for endpoint: EmployeeAPIEndpoints) -> URL? {
        URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json")
    }
}
