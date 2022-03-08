//
//  CacheAsyncImage.swift
//  Block
//
//  Created by Raúl Pera Pairó on 8/3/22.
//

import SwiftUI

struct CacheAsyncImage<Content>: View where Content: View {
    // MARK: Properties
    private let url: URL
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content

    // MARK: Constructor
    init(
        url: URL,
        scale: CGFloat = 1.0,
        transaction: Transaction = Transaction(),
        @ViewBuilder content: @escaping (AsyncImagePhase) -> Content
    ) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }

    // MARK: View
    var body: some View {
        if let cached = ImageCache[url] {
            content(.success(cached))
        } else {
            AsyncImage(
                url: url,
                scale: scale,
                transaction: transaction
            ) { phase in
                cacheAndRender(phase: phase)
            }
        }
    }

    // MARK: Functionality
    func cacheAndRender(phase: AsyncImagePhase) -> some View {
        if case .success(let image) = phase {
            ImageCache[url] = image
        }

        return content(phase)
    }
}

private class ImageCache {
    // MARK: Properties
    static private var cache: [URL: Image] = [:]

    // MARK: Functionality
    static subscript(url: URL) -> Image? {
        get {
            ImageCache.cache[url]
        }
        set {
            ImageCache.cache[url] = newValue
        }
    }
}
