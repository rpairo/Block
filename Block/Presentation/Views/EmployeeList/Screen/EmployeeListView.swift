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
    @State private var searchText = ""

    private var searchResults: [Employee] {
        searchText.isEmpty ?
        viewModel.employees :
        viewModel.employees.filter { $0.name.contains(searchText) }
    }

    // MARK: Views
    var body: some View {
        NavigationView {
            VStack {
                if let error = viewModel.error {
                    ErrorView(error: error)
                } else {
                    ListView(employees: searchResults)
                }
            }
            .navigationTitle("Employees")
        }
        .navigationViewStyle(.stack)
        .onAppear {
            viewModel.onAppear()
        }
        .refreshable {
            viewModel.employees.removeAll()
            viewModel.onRefresh()
        }
        .searchable(text: $searchText)
    }
}
