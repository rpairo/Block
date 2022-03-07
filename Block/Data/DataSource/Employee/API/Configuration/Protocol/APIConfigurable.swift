//
//  APIConfigurable.swift
//  Block
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import Foundation

protocol APIConfigurable {
    // MARK: Functionality
    func buildUrl(for endpoint: EmployeeAPIEndpoints) -> URL?
}
