//
//  EmployeeRepositoryTest.swift
//  BlockTests
//
//  Created by Raúl Pera Pairó on 7/3/22.
//

import XCTest
@testable import Block

class EmployeeRepositoryTest: XCTestCase {
    // MARK: Properties
    var repository: EmployeeRepositable?

    // MARK: Lifecycle
    override func tearDown() {
        self.repository = nil
    }

    // MARK: Tests
    func testRepositoryEmptyList() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let dataSource = EmployeeAPIDataSourceEmptyMock()

        // SUT
        self.repository = EmployeeRepository(dataSource: dataSource)
        self.repository?.fetch { result in
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

    func testRepositoryMalformedList() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let dataSource = EmployeeAPIDataSourceMalformedMock()

        // SUT
        self.repository = EmployeeRepository(dataSource: dataSource)
        self.repository?.fetch { result in
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

    func testRepositoryNoURL() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let dataSource = EmployeeAPIDataSourceNoURLMock()

        // SUT
        self.repository = EmployeeRepository(dataSource: dataSource)
        self.repository?.fetch { result in
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

    func testRepositoryBadURL() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let dataSource = EmployeeAPIDataSourceBadURLMock()

        // SUT
        self.repository = EmployeeRepository(dataSource: dataSource)
        self.repository?.fetch { result in
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

    func testRepositoryMalformedURL() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let dataSource = EmployeeAPIDataSourceMalformedURLMock()

        // SUT
        self.repository = EmployeeRepository(dataSource: dataSource)
        self.repository?.fetch { result in
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

    func testRepositorySuccess() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let dataSource = EmployeeAPIDataSourceSuccessMock()

        // SUT
        self.repository = EmployeeRepository(dataSource: dataSource)
        self.repository?.fetch { result in
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
