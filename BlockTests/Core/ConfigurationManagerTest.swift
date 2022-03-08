//
//  ConfigurationManagerTest.swift
//  BlockTests
//
//  Created by Raúl Pera Pairó on 8/3/22.
//

import XCTest
@testable import Block

class ConfigurationManagerTest: XCTestCase {
    // MARK: Test
    func testConfigurationSuccess() {
        let manager = ConfigurationManager(bundle: Bundle(for: type(of: self )))
        guard let configurator: ConfigurationSuccessMock = manager.build() else {
            XCTFail("Configurator can not be decoded")
            return
        }

        let valueExpected = "Test expected"
        XCTAssertEqual(configurator.value, valueExpected)
    }

    func testConfigurationFailure() {
        let manager = ConfigurationManager(bundle: Bundle(for: type(of: self )))
        guard let _: ConfigurationFailureMock = manager.build() else {
            XCTAssertTrue(true)
            return
        }

        XCTFail("Configurator must not be decoded")
    }
}
