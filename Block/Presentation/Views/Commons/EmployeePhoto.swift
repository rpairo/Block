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
        CacheAsyncImage(url: URL(string: photoURL), transaction: Transaction(animation: .easeInOut)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                failureImage
            @unknown default:
                placeholder
            }
        }
    }

    var placeholder: some View {
        Image(systemName: "person.fill")
    }

    var failureImage: some View {
        Image(systemName: "wifi.slash")
    }
}
