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
    case unkown
}

extension FetchEmployeeError: Equatable {
    static func == (lhs: FetchEmployeeError, rhs: FetchEmployeeError) -> Bool {
        switch (lhs, rhs) {
        case (url, url), (data, data), (decoding, decoding), (emptyList, emptyList), (unkown, unkown):
            return true
        case (statusCode(let lhsCode), statusCode(let rhsCode)):
            return lhsCode ==  rhsCode
        default:
            return false
        }
    }
}

// MARK: Result
typealias FetchEmployeeResult = (Result<[Employee], FetchEmployeeError>) -> Void

// MARK: Protocol
protocol FetchEmployeeUseCaseable {
    func execute(onComplete: @escaping FetchEmployeeResult)
}
