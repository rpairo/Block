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
    let team: String
    let biography: String

    // MARK: View
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(name)
                .font(.headline)

            Text(team)
                .font(.footnote)
                .foregroundColor(.gray)

            Text(biography)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}
