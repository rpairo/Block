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
        image
            .frame(width: size, height: size)
            .background(Color.gray)
            .clipShape(Circle())
    }

    @ViewBuilder
    var image: some View {
        if let url = URL(string: photoURL) {
            CacheAsyncImage(url: url, transaction: Transaction(animation: .easeInOut)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    placeholder
                @unknown default:
                    EmptyView()
                }
            }
        } else {
            placeholder
        }
    }

    var placeholder: some View {
        Image(systemName: "wifi.slash")
    }
}
