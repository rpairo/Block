//
//  EmployeeAPIDataSourceTest.swift
//  BlockTests
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import XCTest
@testable import Block

class EmployeeAPIDataSourceTest: XCTestCase {
    // MARK: Properties
    var dataSource: EmployeeDataSourceable?

    // MARK: Lifecycle
    override func setUp() {
        self.dataSource = EmployeeAPIDataSource()
    }

    override func tearDown() {
        self.dataSource = nil
    }

    // MARK: Tests
    func testEmptyList() {

    }
}
