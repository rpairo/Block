//
//  EmployeeDatabaseDataSource.swift
//  Block
//
//  Created by Raúl Pera Pairó on 29/3/22.
//

import Foundation
import CoreData

struct EmployeeDatabaseDatasource: EmployeeDatabaseable {
    // MARK: Functionality
    func store(onComplete: @escaping StoreEmployeeResult, employees: [Employee]) {
        // Here I can fetch the employee records from table of Core Data, and then, returning with closure.

        // first step
        /*employees.map {
            // convert employee model to database entity
        }*/

        // second step
        // call the Store or save API function from Database framework

        // last step
        // when I will recieve the response of operation, I will return to closure the employee models.

        onComplete(.success([
            Employee(
                id: UUID().uuidString,
                name: "Raul",
                phone: "9863425893",
                email: "mail@mail.com",
                biography: "biography",
                smallPhoto: "https://avatars.githubusercontent.com/u/14141324?s=96&v=4",
                largePhoto: "",
                team: "",
                employeeType: ""
            )]))
    }
}
