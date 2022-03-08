//
//  EmployeeSmallPhoto.swift
//  Block
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import SwiftUI

struct EmployeePhoto: View {
    // MARK: Properties
    let photoURL: String
    let size: CGFloat

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
        .frame(width: size, height: size)
        .background(Color.gray)
        .clipShape(Circle())
    }
}
