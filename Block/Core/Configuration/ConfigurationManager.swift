//
//  ConfigurationManager.swift
//  Block
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import Foundation

struct ConfigurationManager {
    // MARK: Functionality
    func build<T>() -> T? where T: Decodable {
        let bundle = Bundle.main.url(forResource: String(describing: T.self), withExtension: "plist")!
        guard let data = try? Data(contentsOf: bundle) else {
            return nil
        }

        guard let result = try? PropertyListDecoder().decode(T.self, from: data) else {
            return nil
        }

        return result
    }
}
