//
//  LoadingView.swift
//  Block
//
//  Created by Raúl Pera Pairó on 8/3/22.
//

import SwiftUI

struct LoadingView: View {
    // MARK: Properties
    let title: String

    // MARK: View
    var body: some View {
        VStack(alignment: .center) {
            ProgressView()
                .padding()
            Text(title)
        }
    }
}
