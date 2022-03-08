//
//  EmployeeSmallPhoto.swift
//  Block
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import SwiftUI

struct EmployeeSmallPhoto: View {
    // MARK: Properties
    let photoURL: String

    // MARK: View
    var body: some View {
        AsyncImage(url: URL(string: photoURL), transaction: Transaction(animation: .easeInOut)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                Image(systemName: "wifi.slash")
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: 44, height: 44)
        .background(Color.gray)
        .clipShape(Circle())
    }
}
