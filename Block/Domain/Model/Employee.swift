//
//  Employee.swift
//  Block
//
//  Created by Raúl Pera Pairó on 5/3/22.
//

import Foundation

struct Employee: Identifiable {
    // MARK: Properties
    let id: String
    let name: String
    let phone: String
    let email: String
    let biography: String
    let smallPhoto: String
    let largePhoto: String
    let team: String
    let employeeType: String
}
