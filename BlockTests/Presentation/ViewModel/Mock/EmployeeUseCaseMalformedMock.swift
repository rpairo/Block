//
//  EmployeeUseCaseMalformedMock.swift
//  BlockTests
//
//  Created by Raúl Pera Pairó on 8/3/22.
//

import Foundation
@testable import Block

struct EmployeeUseCaseMalformedMock: FetchEmployeeUseCaseable {
    func execute(onComplete: @escaping FetchEmployeeResult) {
        onComplete(.failure(.decoding))
    }
}
