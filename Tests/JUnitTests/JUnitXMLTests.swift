import Foundation
import JUnit
import XCTest

final class JUnitXMLTests: XCTestCase {
    func test_empty() {
        let junit = JUnitXML()
        XCTAssertEqual(junit.display(), "")
    }

    func test_setHeader() {
        var junit = JUnitXML()
        // No header
        XCTAssertEqual(junit.display(), "")

        // Set header
        junit.setHeader(version: "1.0", encoding: "UTF-8")
        XCTAssertEqual(junit.display(), "<?xml version=\"1.0\" encoding=\"UTF-8\"?>")

        // Set header again
        junit.setHeader(version: "2.0", encoding: "UTF-8")
        XCTAssertEqual(junit.display(), "<?xml version=\"2.0\" encoding=\"UTF-8\"?>")
    }
}
