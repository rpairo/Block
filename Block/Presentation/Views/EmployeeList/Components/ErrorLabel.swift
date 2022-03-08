//
//  ErrorLabel.swift
//  Block
//
//  Created by Raúl Pera Pairó on 6/3/22.
//

import SwiftUI

struct ErrorLabel: View {
    // MARK: Properties
    let title: String

    // MARK: View
    var body: some View {
        Text(title)
            .font(.title2)
            .foregroundColor(.red)
            .padding()
    }
}
