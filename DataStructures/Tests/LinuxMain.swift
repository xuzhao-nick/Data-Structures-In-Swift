import XCTest

import DataStructuresTests

var tests = [XCTestCaseEntry]()
tests += DataStructuresTests.allTests()
tests += AlgorithmsTests.allTests()
XCTMain(tests)
