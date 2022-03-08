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
            switch viewModel.state {
            case .idle:
                EmptyView()
            case .error(let error):
                ErrorView(error: error)
            case .loading:
                LoadingView(title: "Loading employees")
            case .loaded:
                list
            }
        }
        .navigationViewStyle(.stack)
        .onAppear {
            viewModel.onAppear {
                self.employees = viewModel.employees
            }
        }
        .onChange(of: searchedText) { searchedText in
            employees = searchedText.isEmpty ?
            viewModel.employees :
            viewModel.employees.filter { $0.name.contains(searchedText) }
        }
    }

    var list: some View {
        ListView(employees: employees)
            .ignoresSafeArea(.keyboard)
            .navigationTitle("Employees")
            .searchable(text: $searchedText)
            .refreshable {
                viewModel.onRefresh {
                    self.employees = viewModel.employees
                }
            }
    }
}
