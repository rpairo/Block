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
    @Published var emailResult: Result<MFMailComposeResult, Error>?

    // MARK: Constructor
    init(employee: Employee) {
        self.employee = employee
    }

    // MARK: Functionality
    func onTapEmail() {
        if MFMailComposeViewController.canSendMail() {
            self.isShowingMailView = true
        }
    }

    func onTapPhone() {

    }
}
