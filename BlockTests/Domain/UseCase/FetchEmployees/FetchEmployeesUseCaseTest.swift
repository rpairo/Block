//
//  FetchEmployeesUseCaseTest.swift
//  BlockTests
//
//  Created by Raúl Pera Pairó on 8/3/22.
//

import XCTest
@testable import Block

class FetchEmployeesUseCaseTest: XCTestCase {
    // MARK: Properties
    var useCase: FetchEmployeeUseCaseable?

    // MARK: Lifecycle
    override func tearDown() {
        self.useCase = nil
    }

    // MARK: Tests
    func testUseCaseEmptyList() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let repository = EmployeeRepositoryEmptyMock()

        // SUT
        self.useCase = FetchEmployeesUseCase(repository: repository)
        self.useCase?.execute { result in
            switch result {
            case .success:
                XCTFail("This test have to return only a error")
            case .failure(let error):
                DispatchQueue.main.async {
                    expectation.fulfill()
                    XCTAssertEqual(error, .emptyList)
                }
            }
        }

        wait(for: [expectation], timeout: 5)
    }

    func testUseCaseMalformedList() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let repository = EmployeeRepositoryMalformedMock()

        // SUT
        self.useCase = FetchEmployeesUseCase(repository: repository)
        self.useCase?.execute { result in
            switch result {
            case .success:
                XCTFail("This test have to return only a error")
            case .failure(let error):
                DispatchQueue.main.async {
                    expectation.fulfill()
                    XCTAssertEqual(error, .decoding)
                }
            }
        }

        wait(for: [expectation], timeout: 5)
    }

    func testUseCaseNoURL() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let repository = EmployeeRepositoryNoURLMock()

        // SUT
        self.useCase = FetchEmployeesUseCase(repository: repository)
        self.useCase?.execute { result in
            switch result {
            case .success:
                XCTFail("This test have to return only a error")
            case .failure(let error):
                DispatchQueue.main.async {
                    expectation.fulfill()
                    XCTAssertEqual(error, .url)
                }
            }
        }

        wait(for: [expectation], timeout: 5)
    }

    func testUseCaseBadURL() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let repository = EmployeeRepositoryBadURLMock()

        // SUT
        self.useCase = FetchEmployeesUseCase(repository: repository)
        self.useCase?.execute { result in
            switch result {
            case .success:
                XCTFail("This test have to return only a error")
            case .failure(let error):
                DispatchQueue.main.async {
                    expectation.fulfill()
                    XCTAssertEqual(error, .statusCode(404))
                }
            }
        }

        wait(for: [expectation], timeout: 5)
    }

    func testUseCaseMalformedURL() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let repository = EmployeeRepositoryMalformedURLMock()

        // SUT
        self.useCase = FetchEmployeesUseCase(repository: repository)
        self.useCase?.execute { result in
            switch result {
            case .success:
                XCTFail("This test have to return only a error")
            case .failure(let error):
                DispatchQueue.main.async {
                    expectation.fulfill()
                    XCTAssertEqual(error, .unkown)
                }
            }
        }

        wait(for: [expectation], timeout: 5)
    }

    func testUseCaseSuccess() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let repository = EmployeeRepositorySuccessMock()

        // SUT
        self.useCase = FetchEmployeesUseCase(repository: repository)
        self.useCase?.execute { result in
            switch result {
            case .success(let employees):
                DispatchQueue.main.async {
                    expectation.fulfill()
                    XCTAssertFalse(employees.isEmpty)
                }
            case .failure:
                XCTFail("This test have not to return a error")
            }
        }

        wait(for: [expectation], timeout: 5)
    }
}
