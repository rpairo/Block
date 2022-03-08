//
//  EmployeeAPIConfiguration.swift
//  Block
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import Foundation

struct EmployeeAPIConfigManager: APIConfigurable {
    // MARK: Functionality
    func buildUrl(for endpoint: EmployeeAPIEndpoints) -> URL? {
        let configManager = ConfigurationManager(bundle: .main)
        guard let config: EmployeeAPIConfiguration = configManager.build() else {
            return nil
        }

        let url = "\(config.url)/\(endpoint.rawValue).json"
        return URL(string: url)
    }
}
