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
    let employee: Employee

    // MARK: View
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            CacheAsyncImage(url: URL(string: employee.largePhoto), transaction: Transaction(animation: .easeInOut)) { phase in
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
                EmployeeLabelView(title: "Name", value: employee.name)
                EmployeeLabelView(title: "Email", value: employee.email)
                    .onTapGesture {
                        viewModel.onTapEmail(email: employee.email)
                    }
                EmployeeLabelView(title: "Phone", value: employee.phone)
                    .onTapGesture {
                        viewModel.onTapPhone(phone: employee.phone)
                    }
                EmployeeLabelView(title: "Team", value: employee.team)
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
