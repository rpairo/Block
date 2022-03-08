//
//  EmployeeRepositoryBadURLMock.swift
//  BlockTests
//
//  Created by Raúl Pera Pairó on 8/3/22.
//

import Foundation
@testable import Block

struct EmployeeRepositoryBadURLMock: EmployeeRepositable {
    func fetch(onComplete: @escaping FetchEmployeeResult) {
        onComplete(.failure(.statusCode(404)))
    }
}
