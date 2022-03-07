//
//  EmployeeDataSourceable.swift
//  Block
//
//  Created by Raúl Pera Pairó on 5/3/22.
//

import Foundation

protocol EmployeeDataSourceable {
    // MARK: Functionality
    func fetch(onComplete: @escaping FetchEmployeeResult)
}
