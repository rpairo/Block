//
//  EmployeeAPIDataSource.swift
//  Block
//
//  Created by Raúl Pera Pairó on 5/3/22.
//

import Foundation

struct EmployeeAPIDataSource: EmployeeDataSourceable {
    // MARK: Properties
    let configuration: APIConfigurable

    // MARK: Functionality
    func fetch(onComplete: @escaping FetchEmployeeResult) {
        guard let url = configuration.buildUrl(for: .employees) else {
            onComplete(.failure(.url))
            return
        }

        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, response, error in
            switch decode(data, response, error) {
            case .success(let employee):
                let employees = transform(dto: employee)
                onComplete(.success(employees))
            case .failure(let error):
                onComplete(.failure(error))
            }
        }
        .resume()
    }
}
