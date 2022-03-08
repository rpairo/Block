//
//  ListView.swift
//  Block
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import SwiftUI

struct ListView: View {
    // MARK: Properties
    let employees: [Employee]

    // MARK: View
    var body: some View {
        List {
            ForEach(employees) { employee in
                NavigationLink(destination: Text(employee.name)) {
                    EmployeeRow(employee: employee)
                        .padding(.vertical, 10)
                }
            }
        }
    }
}
