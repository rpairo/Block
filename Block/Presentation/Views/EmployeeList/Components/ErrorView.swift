//
//  ErrorView.swift
//  Block
//
//  Created by Raúl Pera Pairó on 6/3/22.
//

import SwiftUI

struct ErrorView: View {
    // MARK: Properties
    var error: FetchEmployeeError

    // MARK: View
    var body: some View {
        switch error {
        case .decoding:
            ErrorLabel(title: "Decoding error")
        case .url:
            ErrorLabel(title: "URL error")
        case .emptyList:
            ErrorLabel(title: "Empty list")
        case .data:
            ErrorLabel(title: "Data error")
        case .statusCode:
            ErrorLabel(title: "Status code error")
        case .unkown:
            ErrorLabel(title: "Unkown error")
        }
    }
}
