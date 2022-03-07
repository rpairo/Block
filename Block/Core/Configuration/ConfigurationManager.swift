//
//  ConfigurationManager.swift
//  Block
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import Foundation

struct ConfigurationManager {
    // MARK: Functionality
    func value<T>(from: String) -> T? where T: Decodable {
        let bundle = Bundle.main.url(forResource: from, withExtension: "plist")!
        guard let data = try? Data(contentsOf: bundle) else {
            return nil
        }

        guard let result = try? PropertyListDecoder().decode(T.self, from: data) else {
            return nil
        }

        return result
    }
}
