//
//  EmployeeListViewModelTest.swift
//  BlockTests
//
//  Created by Raúl Pera Pairó on 8/3/22.
//

import XCTest
@testable import Block

class EmployeeListViewModelTest: XCTestCase {
    // MARK: Properties
    var viewModel: EmployeeListViewModel?

    // MARK: Lifecycle
    override func tearDown() {
        self.viewModel = nil
    }

    // MARK: Tests
    func testViewModelEmptyList() throws {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let useCase = EmployeeUseCaseEmptyMock()

        // SUT
        self.viewModel = EmployeeListViewModel(fetchEmployeeUseCase: useCase)
        self.viewModel?.fetchEmployees { result in
            switch result {
            case .success:
                XCTFail("This test have to return only a error")
            case .failure(let error):
                DispatchQueue.main.async {
                    expectation.fulfill()
                    XCTAssertEqual(error, .emptyList)
                    XCTAssertEqual(self.viewModel?.error, .emptyList)
                    XCTAssertEqual(self.viewModel?.employees.count, 0)
                }
            }
        }

        wait(for: [expectation], timeout: 5)
    }
}
