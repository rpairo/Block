//
//  EmployeeAPIDataSource+URL.swift
//  Block
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import Foundation

// MARK: URL
extension EmployeeAPIDataSource {
    func buildURL(endpoint: EmployeeEndpoints) -> URL? {
        guard let url = endpoint.url else {
            return nil
        }
        return url
    }
}
