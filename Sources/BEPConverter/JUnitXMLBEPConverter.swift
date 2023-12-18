import Foundation
import JUnit

public struct JUnitXMLBEPConverter: BEPConverter {

    public init() {}

    public func convert(_ file: URL) async throws -> JUnitXML {
        var junit = JUnitXML()
        junit.setHeader(version: "1.0", encoding: "UTF-8")
        return junit
    }
}
