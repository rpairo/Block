//
//  EmployeeEndpoints.swift
//  Block
//
//  Created by Raúl Pera Pairó on 5/3/22.
//

import Foundation

private struct EmployeesURL: Decodable {
    // MARK: Properties
    let url: String

    // MARK: Keys
    enum CodingKeys: String, CodingKey {
        case url = "url_base"
    }
}

enum EmployeeEndpoints: String {
    // MARK: Cases
    case employees

    // MARK: Properties
    var url: URL? {
        let bundle = Bundle.main.url(forResource: "EmployeeConfiguration", withExtension: "plist")!
        guard let data = try? Data(contentsOf: bundle) else {
            return nil
        }

        guard let result = try? PropertyListDecoder().decode(EmployeesURL.self, from: data) else {
            return nil
        }

        let url = "\(result.url)/\(self.rawValue).json"

        return URL(string: url)
    }
}
