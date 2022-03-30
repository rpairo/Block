//
//  MailView.swift
//  Block
//
//  Created by Raúl Pera Pairó on 29/3/22.
//

import SwiftUI
import UIKit
import MessageUI

typealias MailViewCallback = ((Result<MFMailComposeResult, Error>) -> Void)?

struct MailView: UIViewControllerRepresentable {
    // MARK: Properties
    @Environment(\.presentationMode) var presentation
    @Binding var data: ComposeMailData
    let callback: MailViewCallback

    // MARK: Functionality
    func makeCoordinator() -> Coordinator {
        Coordinator(presentation: presentation, data: $data, callback: callback)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let viewController = MFMailComposeViewController()
        viewController.mailComposeDelegate = context.coordinator
        viewController.setSubject(data.subject)
        viewController.setToRecipients(data.recipients)
        viewController.setMessageBody(data.message, isHTML: false)
        data.attachments?.forEach {
            viewController.addAttachmentData($0.data, mimeType: $0.mimeType, fileName: $0.fileName)
        }
        viewController.accessibilityElementDidLoseFocus()
        return viewController
    }

    func updateUIViewController(
        _ uiViewController: MFMailComposeViewController,
        context: UIViewControllerRepresentableContext<MailView>
    ) {}

    static var canSendMail: Bool {
        MFMailComposeViewController.canSendMail()
    }
}

struct ComposeMailData {
    let subject: String
    let recipients: [String]?
    let message: String
    let attachments: [AttachmentData]?
}

struct AttachmentData {
    let data: Data
    let mimeType: String
    let fileName: String
}

class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
    @Binding var presentation: PresentationMode
    @Binding var data: ComposeMailData
    let callback: MailViewCallback

    init(
        presentation: Binding<PresentationMode>,
        data: Binding<ComposeMailData>,
        callback: MailViewCallback
    ) {
        _presentation = presentation
        _data = data
        self.callback = callback
    }

    func mailComposeController(
        _ controller: MFMailComposeViewController,
        didFinishWith result: MFMailComposeResult,
        error: Error?
    ) {
        if let error = error {
            callback?(.failure(error))
        } else {
            callback?(.success(result))
        }

        $presentation.wrappedValue.dismiss()
    }
}
