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

            VStack(alignment: .leading) {
                EmployeeLabelView(title: "Name", value: viewModel.employee.name)
                EmployeeLabelView(title: "Email", value: viewModel.employee.email)
                    .onTapGesture {
                        viewModel.onTapEmail()
                    }
                    .sheet(isPresented: $viewModel.isShowingMailView) {
                        MailView(result: $viewModel.emailResult)
                    }
                EmployeeLabelView(title: "Phone", value: viewModel.employee.phone)
                    .onTapGesture {
                        viewModel.onTapPhone()
                    }
                EmployeeLabelView(title: "Team", value: viewModel.employee.team)
            }
        }
    }

    var placeholder: some View {
        ZStack {
            Image(systemName: "person.fill")
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
}
