import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DataStructuresTests.allTests),
        testCase(AlgorithmsTests.allTests)
    ]
}
#endif
