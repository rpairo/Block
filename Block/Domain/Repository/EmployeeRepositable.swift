//
//  EmployeeRepositable.swift
//  Block
//
//  Created by Raúl Pera Pairó on 5/3/22.
//

import Foundation

protocol EmployeeRepositable {
    // MARK: Functionality
    func fetch(onComplete: @escaping FetchEmployeeResult)
}
