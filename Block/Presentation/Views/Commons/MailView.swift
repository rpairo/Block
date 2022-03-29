//
//  MailView.swift
//  Block
//
//  Created by Raúl Pera Pairó on 29/3/22.
//

import SwiftUI
import UIKit
import MessageUI

struct MailView: UIViewControllerRepresentable {
    // MARK: Properties
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?

    // MARK: Functionality
    func makeCoordinator() -> Coordinator {
        Coordinator(presentation: presentation, result: $result)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let viewController = MFMailComposeViewController()
        viewController.mailComposeDelegate = context.coordinator
        return viewController
    }

    func updateUIViewController(
        _ uiViewController: MFMailComposeViewController,
        context: UIViewControllerRepresentableContext<MailView>
    ) {

    }
}

class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
    // MARK: Properties
    @Binding var presentation: PresentationMode
    @Binding var result: Result<MFMailComposeResult, Error>?

    // MARK: Constructor
    init(presentation: Binding<PresentationMode>,
         result: Binding<Result<MFMailComposeResult, Error>?>) {
        _presentation = presentation
        _result = result
    }

    // MARK: Functionality
    func mailComposeController(
        _ controller: MFMailComposeViewController,
        didFinishWith result: MFMailComposeResult,
        error: Error?
    ) {
        defer {
            $presentation.wrappedValue.dismiss()
        }
        guard error == nil else {
            self.result = .failure(error!)
            return
        }
        self.result = .success(result)
    }
}
