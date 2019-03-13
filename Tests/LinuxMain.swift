import XCTest

import miscellaneousTests

var tests = [XCTestCaseEntry]()
tests += miscellaneousTests.allTests()
XCTMain(tests)