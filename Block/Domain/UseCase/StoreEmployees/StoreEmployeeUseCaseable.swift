//
//  StoreEmployeeUseCaseable.swift
//  Block
//
//  Created by Raúl Pera Pairó on 29/3/22.
//

import Foundation

// MARK: Error
enum StoreEmployeeError: Error {
    case data
    case decoding
    case emptyList
    case unkown
}

// MARK: Result
typealias StoreEmployeeResult = (Result<[Employee], StoreEmployeeError>) -> Void

protocol StoreEmployeeUseCaseable {
    func execute(onComplete: @escaping StoreEmployeeResult, employees: [Employee])
}
