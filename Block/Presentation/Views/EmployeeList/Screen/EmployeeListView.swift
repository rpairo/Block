//
//  ListView.swift
//  Block
//
//  Created by Raúl Pera Pairó on 5/3/22.
//

import SwiftUI

struct EmployeeListView: View {
    // MARK: Properties
    @StateObject var viewModel: EmployeeListViewModel
    @State private var searchedText = ""
    @State private var employees = [Employee]()

    // MARK: Views
    var body: some View {
        NavigationView {
            VStack {
                if let error = viewModel.error {
                    ErrorView(error: error)
                } else {
                    ListView(employees: employees)
                }
            }

            .ignoresSafeArea(.keyboard)
            .navigationTitle("Employees")
            .searchable(text: $searchedText)
            .refreshable {
                viewModel.onRefresh {
                    employees = viewModel.employees
                }
            }
        }
        .navigationViewStyle(.stack)
        .onAppear {
            viewModel.onAppear {
                employees = viewModel.employees
            }
        }
        .onChange(of: searchedText) { searchedText in
            employees = searchedText.isEmpty ?
            viewModel.employees :
            viewModel.employees.filter { $0.name.contains(searchedText) }
        }
    }
}
