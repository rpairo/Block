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
    func testViewModelEmptyList() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let useCase = EmployeeUseCaseEmptyMock()

        // SUT
        self.viewModel = EmployeeListViewModel(fetchEmployeeUseCase: useCase)
        self.viewModel?.fetchEmployees { [weak self] result in
            switch result {
            case .success:
                XCTFail("This test have to return only a error")
            case .failure(let error):
                DispatchQueue.main.async {
                    expectation.fulfill()
                    XCTAssertEqual(error, .emptyList)
                    XCTAssertEqual(self?.viewModel?.state, .error(.emptyList))
                    XCTAssertEqual(self?.viewModel?.employees.count, 0)
                }
            }
        }

        wait(for: [expectation], timeout: 5)
    }

    func testViewModelMalformedList() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let useCase = EmployeeUseCaseMalformedMock()

        // SUT
        self.viewModel = EmployeeListViewModel(fetchEmployeeUseCase: useCase)
        self.viewModel?.fetchEmployees { [weak self] result in
            switch result {
            case .success:
                XCTFail("This test have to return only a error")
            case .failure(let error):
                DispatchQueue.main.async {
                    expectation.fulfill()
                    XCTAssertEqual(error, .decoding)
                    XCTAssertEqual(self?.viewModel?.state, .error(.decoding))
                    XCTAssertEqual(self?.viewModel?.employees.count, 0)
                }
            }
        }

        wait(for: [expectation], timeout: 5)
    }

    func testViewModelNoURL() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let useCase = EmployeeUseCaseNoURLMock()

        // SUT
        self.viewModel = EmployeeListViewModel(fetchEmployeeUseCase: useCase)
        self.viewModel?.fetchEmployees { [weak self] result in
            switch result {
            case .success:
                XCTFail("This test have to return only a error")
            case .failure(let error):
                DispatchQueue.main.async {
                    expectation.fulfill()
                    XCTAssertEqual(error, .url)
                    XCTAssertEqual(self?.viewModel?.state, .error(.url))
                    XCTAssertEqual(self?.viewModel?.employees.count, 0)
                }
            }
        }

        wait(for: [expectation], timeout: 5)
    }

    func testViewModelBadURL() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let useCase = EmployeeUseCaseBadURLMock()

        // SUT
        self.viewModel = EmployeeListViewModel(fetchEmployeeUseCase: useCase)
        self.viewModel?.fetchEmployees { [weak self] result in
            switch result {
            case .success:
                XCTFail("This test have to return only a error")
            case .failure(let error):
                DispatchQueue.main.async {
                    expectation.fulfill()
                    XCTAssertEqual(error, .statusCode(404))
                    XCTAssertEqual(self?.viewModel?.state, .error(.statusCode(404)))
                    XCTAssertEqual(self?.viewModel?.employees.count, 0)
                }
            }
        }

        wait(for: [expectation], timeout: 5)
    }

    func testViewModelMalformedURL() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let useCase = EmployeeUseCaseMalformedURLMock()

        // SUT
        self.viewModel = EmployeeListViewModel(fetchEmployeeUseCase: useCase)
        self.viewModel?.fetchEmployees { [weak self] result in
            switch result {
            case .success:
                XCTFail("This test have to return only a error")
            case .failure(let error):
                DispatchQueue.main.async {
                    expectation.fulfill()
                    XCTAssertEqual(error, .unkown)
                    XCTAssertEqual(self?.viewModel?.state, .error(.unkown))
                    XCTAssertEqual(self?.viewModel?.employees.count, 0)
                }
            }
        }

        wait(for: [expectation], timeout: 5)
    }

    func testViewModelSuccess() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let useCase = EmployeeUseCaseSuccessMock()

        // SUT
        self.viewModel = EmployeeListViewModel(fetchEmployeeUseCase: useCase)
        self.viewModel?.fetchEmployees { [weak self] result in
            switch result {
            case .success(let employees):
                DispatchQueue.main.async {
                    expectation.fulfill()
                    XCTAssertFalse(employees.isEmpty)
                    XCTAssertEqual(self?.viewModel?.state, .loaded)
                }
            case .failure:
                XCTFail("This test have not to return a error")
            }
        }

        wait(for: [expectation], timeout: 5)
    }

    func testViewModelStateIdle() {
        // Mock
        let useCase = EmployeeUseCaseSuccessMock()

        // SUT
        self.viewModel = EmployeeListViewModel(fetchEmployeeUseCase: useCase)
        XCTAssertEqual(self.viewModel?.state, .idle)
    }
}
