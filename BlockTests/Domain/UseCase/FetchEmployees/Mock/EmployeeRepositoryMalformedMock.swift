//
//  EmployeeRepositoryMalformedMock.swift
//  BlockTests
//
//  Created by Raúl Pera Pairó on 8/3/22.
//

import Foundation
@testable import Block

struct EmployeeRepositoryMalformedMock: EmployeeRepositable {
    func fetch(onComplete: @escaping FetchEmployeeResult) {
        onComplete(.failure(.decoding))
    }
}
