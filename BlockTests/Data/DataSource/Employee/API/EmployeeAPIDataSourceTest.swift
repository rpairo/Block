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
    override func tearDown() {
        self.dataSource = nil
    }

    // MARK: Tests
    func testDataSourceEmptyList() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let config = EmployeeAPIConfigManagerEmptyMock()

        // SUT
        self.dataSource = EmployeeAPIDataSource(configuration: config)
        self.dataSource?.fetch { result in
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

    func testDataSourceMalformedList() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let config = EmployeeAPIConfigManagerMalformedMock()

        // SUT
        self.dataSource = EmployeeAPIDataSource(configuration: config)
        self.dataSource?.fetch { result in
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

    func testDataSourceNoURL() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let config = EmployeeAPIConfigManagerNoURLMock()

        // SUT
        self.dataSource = EmployeeAPIDataSource(configuration: config)
        self.dataSource?.fetch { result in
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

    func testDataSourceBadURL() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let config = EmployeeAPIConfigManagerBadURLMock()

        // SUT
        self.dataSource = EmployeeAPIDataSource(configuration: config)
        self.dataSource?.fetch { result in
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

    func testDataSourceMalformedURL() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let config = EmployeeAPIConfigManagerMalformedURLMock()

        // SUT
        self.dataSource = EmployeeAPIDataSource(configuration: config)
        self.dataSource?.fetch { result in
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

    func testDataSourceSuccess() {
        // Expectation
        let expectation = self.expectation(description: #function)

        // Mock
        let config = EmployeeAPIConfigManagerSuccessMock()

        // SUT
        self.dataSource = EmployeeAPIDataSource(configuration: config)
        self.dataSource?.fetch { result in
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
