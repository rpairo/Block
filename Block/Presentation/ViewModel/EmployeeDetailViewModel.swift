//
//  EmployeeDetailViewModel.swift
//  Block
//
//  Created by Raúl Pera Pairó on 29/3/22.
//

import Foundation
import MessageUI

class EmployeeDetailViewModel: ObservableObject {
    // MARK: Properties
    let employee: Employee
    @Published var isShowingMailView = false
    @Published var mailData = ComposeMailData(subject: "", recipients: nil, message: "", attachments: nil)

    // MARK: Constructor
    init(employee: Employee) {
        self.employee = employee
    }

    // MARK: Functionality
    func onTapEmail() {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }

        self.isShowingMailView = true
        self.mailData = ComposeMailData(
            subject: "A subject",
            recipients: [employee.email],
            message: "Here's a message",
            attachments: [
                AttachmentData(
                    data: "Some text".data(using: .utf8)!,
                    mimeType: "text/plain",
                    fileName: "text.txt"
                )
            ]
        )
    }

    func onTapPhone() {
        let phone = "tel://"
        let phoneNumberformatted = phone + employee.phone
        guard let url = URL(string: phoneNumberformatted) else { return }
        UIApplication.shared.open(url)
    }
}
