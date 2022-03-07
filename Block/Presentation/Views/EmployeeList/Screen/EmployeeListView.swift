//
//  ListView.swift
//  Block
//
//  Created by Raúl Pera Pairó on 5/3/22.
//

import SwiftUI

struct EmployeeListView: View {
    // MARK: Properties
    @StateObject var viewModel: ListViewModel

    // MARK: Views
    var body: some View {
        NavigationView {
            VStack {
                if let error = viewModel.error {
                    ErrorView(error: error)
                } else {
                    ListView(employees: viewModel.employees)
                }
            }
            .navigationTitle("Employees")
        }
        .navigationViewStyle(.stack)
        .onAppear {
            viewModel.onAppear()
        }
    }
}
