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

    // MARK: View
    var body: some View {
        HStack {
            Text(employee.name)
            Text(employee.id)
        }
    }
}
