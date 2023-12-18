import Foundation

/// A type for representing a single JUnit XML file.
///
/// Mostly follows: https://github.com/testmoapp/junitxml
public struct JUnitXML {
    private var header: JUnitXMLHeader?
    private var nodes: [JUnitXMLNode] = []

    public init() {}

    public mutating func setHeader(
        version: String,
        encoding: String
    ) {
        header = JUnitXMLHeader(version: version, encoding: encoding)
    }

    public func display(indent: Int = 0) -> String {
        let header = self.header?.xml(indent)
        let xml = nodes
            .map { $0.xml(indent) }
            .joined(separator: "\n")

        return [
            header,
            xml
        ]
            .lazy
            .map { ($0?.isEmpty ?? false) ? nil : $0 }
            .compactMap { $0 }
            .joined(separator: "\n")
    }
}
