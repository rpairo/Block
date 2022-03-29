//
//  EmployeeLabelView.swift
//  Block
//
//  Created by Raúl Pera Pairó on 29/3/22.
//

import SwiftUI

struct EmployeeLabelView: View {
    // MARK: Properties
    let title: String
    let value: String

    // MARK: View
    var body: some View {
        HStack {
            Text(title)
                .bold()
                .foregroundColor(.black)

            Text(value)
                .foregroundColor(.gray)
        }
    }
}
