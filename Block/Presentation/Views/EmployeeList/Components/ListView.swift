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
    private var groupeds: [String: [Employee]] {
        Dictionary(grouping: employees) { $0.team }
    }

    // MARK: View
    var body: some View {
        List {
            ForEach(groupeds.keys.sorted(), id: \.self) { team in
                Section(team) {
                    ForEach(groupeds[team]?.sorted { $0.name < $1.name } ?? []) { employee in
                        NavigationLink(destination: EmployeeDetailView(employee: employee)) {
                            EmployeeRow(employee: employee)
                                .padding(.vertical, 10)
                        }
                    }
                }
            }
        }
    }
}
