//
//  ConfigurationFailureMock.swift
//  BlockTests
//
//  Created by Raúl Pera Pairó on 8/3/22.
//

import Foundation
@testable import Block

struct ConfigurationFailureMock: Decodable {
    // MARK: Properties
    let value: String

    // MARK: Keys
    enum CodingKeys: String, CodingKey {
        case value
    }
}
