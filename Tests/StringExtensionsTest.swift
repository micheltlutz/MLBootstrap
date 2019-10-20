//
//  StringExtensionsTest.swift
//  MLBootstrapTests-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 29/09/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import XCTest
@testable import MLBootstrap

class StringExtensionsTest: XCTestCase {
    var dateStringBirth: String = "13/01/1988"
    var dateDBStringBirth: String = "1988-01-13"

    func testDmyToymd() {
        let dbDateBirth = dateStringBirth.dmyToymd()

        XCTAssertEqual(dbDateBirth, "1988-01-13")
    }

    func testYmdTodmy() {
        let dbDateBirth = dateDBStringBirth.ymdTodmy()

        XCTAssertEqual(dbDateBirth, "13/01/1988")
    }

    func testCleanEmail() {
        let email = "michel_lutz123@icloud.com"
        let onlynumbersAndChar = email.removeOccurrences()

        XCTAssertEqual(onlynumbersAndChar, "michellutz123icloudcom")
    }
}
