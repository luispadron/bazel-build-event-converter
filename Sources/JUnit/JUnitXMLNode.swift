import Foundation

/// Represents a node in the JUnit XML tree.
public protocol JUnitXMLNode {

    /// The XML representation of the node.
    /// - Parameter indent: The number of spaces to indent the node.
    /// - Returns: The XML representation of the node.
    func xml(_ indent: Int) -> String
}

// MARK: - Header

public struct JUnitXMLHeader: JUnitXMLNode {
    var version: String
    var encoding: String

    public init(version: String, encoding: String) {
        self.version = version
        self.encoding = encoding
    }

    public func xml(_ indent: Int) -> String {
        return "<?xml version=\"\(version)\" encoding=\"\(encoding)\"?>"
            .indented(indent)
    }
}

// MARK: - Helpers

private extension String {
    func indented(_ indent: Int) -> String {
        return String(repeating: " ", count: indent) + self
    }
}
