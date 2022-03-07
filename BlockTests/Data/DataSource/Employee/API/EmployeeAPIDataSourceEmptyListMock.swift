//
//  EmployeeAPIDataSourceMock.swift
//  BlockTests
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import Foundation
@testable import Block

class EmployeeAPIDataSourceEmptyListMock: EmployeeAPIDataSource {
    override func buildURL(endpoint: EmployeeAPIEndpoints) -> URL? {
        return URL(string: "")
    }
}
