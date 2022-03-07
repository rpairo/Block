//
//  EmployeeRowBody.swift
//  Block
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import SwiftUI

struct EmployeeDescription: View {
    // MARK: Properties
    let name: String
    let biography: String

    // MARK: View
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.title2)

            Text(biography)
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}
