//
//  EmployeeDetailView.swift
//  Block
//
//  Created by Raúl Pera Pairó on 29/3/22.
//

import SwiftUI

struct EmployeeDetailView: View {
    // MARK: Properties
    @StateObject var viewModel: EmployeeDetailViewModel

    // MARK: View
    var body: some View {
        VStack(alignment: .center) {
            CacheAsyncImage(
                url: URL(string: viewModel.employee.largePhoto),
                transaction: Transaction(animation: .easeInOut)
            ) { phase in
                switch phase {
                case .empty:
                    placeholder
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .scaledToFit()
                        .padding()
                case .failure:
                    failureImage
                @unknown default:
                    placeholder
                }
            }

            VStack(alignment: .leading, spacing: 10) {
                EmployeeLabelView(title: "Name", value: viewModel.employee.name)
                EmployeeLabelView(title: "Email", value: viewModel.employee.email)
                    .onTapGesture {
                        viewModel.onTapEmail()
                    }
                    .sheet(isPresented: $viewModel.isShowingMailView) {
                        MailView(data: $viewModel.mailData) { result in
                            print(result)
                        }
                    }
                EmployeeLabelView(title: "Phone", value: viewModel.employee.phone)
                    .onTapGesture {
                        viewModel.onTapPhone()
                    }
                EmployeeLabelView(title: "Team", value: viewModel.employee.team)
                EmployeeLabelView(title: "Employee type", value: viewModel.employee.employeeType)
                EmployeeLabelView(title: "ID", value: viewModel.employee.id)
                EmployeeLabelView(title: "Biography", value: viewModel.employee.biography)
            }
            .padding()
        }

        .navigationTitle(viewModel.employee.name)
    }
}

var placeholder: some View {
    ZStack {
        Image("placeholder")
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .scaledToFit()
            .padding()
        ProgressView()
    }
}

var failureImage: some View {
    Image(systemName: "wifi.slash")
}
