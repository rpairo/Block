//
//  RetrieveEmployeesUseCaseable.swift
//  Block
//
//  Created by Raúl Pera Pairó on 30/3/22.
//

import Foundation

// MARK: Error
enum RetrieveEmployeeError: Error {
    case data
    case decoding
    case emptyList
    case unkown
}

// MARK: Result
typealias RetrieveEmployeeResult = (Result<[Employee], RetrieveEmployeeError>) -> Void

protocol RetrieveEmployeesUseCaseable {
    func execute(onComplete: @escaping RetrieveEmployeeResult, employees: [Employee])
}
