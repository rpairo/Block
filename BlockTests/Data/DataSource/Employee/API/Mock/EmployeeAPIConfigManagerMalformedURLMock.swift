//
//  EmployeeAPIConfigManagerMalformedURLMock.swift
//  BlockTests
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import Foundation
@testable import Block

struct EmployeeAPIConfigManagerMalformedURLMock: APIConfigurable {
    func buildUrl(for endpoint: EmployeeAPIEndpoints) -> URL? {
        URL(string: "https://abcde")
    }
}
