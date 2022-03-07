//
//  FetchEmployeeUseCaseable.swift
//  Block
//
//  Created by Raúl Pera Pairó on 5/3/22.
//

import Foundation

// MARK: Error
enum FetchEmployeeError: Error {
    case url
    case data
    case statusCode(Int)
    case decoding
    case emptyList
    case unkown(Error)
}

// MARK: Result
typealias FetchEmployeeResult = (Result<[Employee], FetchEmployeeError>) -> Void

// MARK: Protocol
protocol FetchEmployeeUseCaseable {
    func execute(onComplete: @escaping FetchEmployeeResult)
}
