//
//  EmployeeRow.swift
//  Block
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import SwiftUI

struct EmployeeRow: View {
    // MARK: Properties
    let employee: Employee

    // MARK: Views
    var body: some View {
        HStack {
            photo
            description
                .padding(.horizontal)
        }
    }

    var photo: some View {
        EmployeeSmallPhoto(photoURL: employee.smallPhoto)
    }

    var description: some View {
        EmployeeDescription(
            name: employee.name,
            biography: employee.biography
        )
    }
}
