//
//  EmployeeAPIConfiguration.swift
//  Block
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import Foundation

struct EmployeeAPIConfiguration: Decodable {
    // MARK: Properties
    let url: String

    // MARK: Keys
    enum CodingKeys: String, CodingKey {
        case url = "url_base"
    }
}
