//
//  EmployeeAPIConfigManagerURLNilMock.swift
//  BlockTests
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import Foundation
@testable import Block

struct EmployeeAPIConfigManagerNoURLMock: APIConfigurable {
    func buildUrl(for endpoint: EmployeeAPIEndpoints) -> URL? {
        nil
    }
}
