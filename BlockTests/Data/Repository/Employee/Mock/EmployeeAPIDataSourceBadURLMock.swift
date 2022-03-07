//
//  EmployeeAPIDataSourceBadURLMock.swift
//  BlockTests
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import Foundation
@testable import Block

struct EmployeeAPIDataSourceBadURLMock: EmployeeDataSourceable {
    func fetch(onComplete: @escaping FetchEmployeeResult) {
        onComplete(.failure(.statusCode(404)))
    }
}
