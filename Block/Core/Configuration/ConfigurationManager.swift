//
//  ConfigurationManager.swift
//  Block
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import Foundation

struct ConfigurationManager {
    // MARK: Properties
    let bundle: Bundle

    // MARK: Functionality
    func build<T>() -> T? where T: Decodable {
        let resource = String(describing: T.self)
        guard let bundle = bundle.url(forResource: resource, withExtension: "plist") else {
            return nil
        }

        guard let data = try? Data(contentsOf: bundle) else {
            return nil
        }

        guard let result = try? PropertyListDecoder().decode(T.self, from: data) else {
            return nil
        }

        return result
    }
}
