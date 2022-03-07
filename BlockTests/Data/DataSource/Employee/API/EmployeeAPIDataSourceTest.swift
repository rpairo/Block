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
    func testEmptyList() {
        // Expectation
        let expectation = XCTestExpectation(description: #function)

        // Mock
        let config = EmployeeAPIConfigManagerEmptyMock()

        // SUT
        self.dataSource = EmployeeAPIDataSource(configuration: config)
        self.dataSource?.fetch { result in
            switch result {
            case .success:
                XCTFail("This test have to return only a error")
            case .failure(let error):
                expectation.fulfill()
                DispatchQueue.main.async {
                    XCTAssertEqual(error, .emptyList)
                }
            }
        }

        wait(for: [expectation], timeout: 5)
    }

    func testMalformedList() {
        // Expectation
        let expectation = XCTestExpectation(description: #function)

        // Mock
        let config = EmployeeAPIConfigManagerMalformedMock()

        // SUT
        self.dataSource = EmployeeAPIDataSource(configuration: config)
        self.dataSource?.fetch { result in
            switch result {
            case .success:
                XCTFail("This test have to return only a error")
            case .failure(let error):
                expectation.fulfill()
                DispatchQueue.main.async {
                    XCTAssertEqual(error, .decoding)
                }
            }
        }

        wait(for: [expectation], timeout: 5)
    }

    func testNoURL() {
        // Expectation
        let expectation = XCTestExpectation(description: #function)

        // Mock
        let config = EmployeeAPIConfigManagerNoURLMock()

        // SUT
        self.dataSource = EmployeeAPIDataSource(configuration: config)
        self.dataSource?.fetch { result in
            switch result {
            case .success:
                XCTFail("This test have to return only a error")
            case .failure(let error):
                expectation.fulfill()
                DispatchQueue.main.async {
                    XCTAssertEqual(error, .url)
                }
            }
        }

        wait(for: [expectation], timeout: 5)
    }

    func testBadURL() {
        // Expectation
        let expectation = XCTestExpectation(description: #function)

        // Mock
        let config = EmployeeAPIConfigManagerBadURLMock()

        // SUT
        self.dataSource = EmployeeAPIDataSource(configuration: config)
        self.dataSource?.fetch { result in
            switch result {
            case .success:
                XCTFail("This test have to return only a error")
            case .failure(let error):
                expectation.fulfill()
                DispatchQueue.main.async {
                    XCTAssertEqual(error, .statusCode(404))
                }
            }
        }

        wait(for: [expectation], timeout: 5)
    }

    func testMalformedURL() {
        // Expectation
        let expectation = XCTestExpectation(description: #function)

        // Mock
        let config = EmployeeAPIConfigManagerMalformedURLMock()

        // SUT
        self.dataSource = EmployeeAPIDataSource(configuration: config)
        self.dataSource?.fetch { result in
            switch result {
            case .success:
                XCTFail("This test have to return only a error")
            case .failure(let error):
                expectation.fulfill()
                DispatchQueue.main.async {
                    XCTAssertEqual(error, .unkown)
                }
            }
        }

        wait(for: [expectation], timeout: 5)
    }
}
