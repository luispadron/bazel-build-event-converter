import ArgumentParser
import Foundation
import BEPConverter

@main
struct BepcCommand: AsyncParsableCommand {

    static var configuration = CommandConfiguration(
        commandName: "bepc",
        abstract: "Converts BEP files into supported formats.",
        discussion: """
        `bepc` can be provided a Bazel Build Event Protocol binary file and will convert it into a supported format.

        For example, to convert a BEP file into a JUnit XML file for test results:
            - 'bepc junit /path/to/bep.bin > /path/to/junit.xml'
        """
    )

    @Argument(help: "The format to convert the BEP file into.")
    var format: Format = .junit

    func run() async throws {
        let output = try await format.convert()
        print(output)
    }
}

extension BepcCommand {
    enum Format: String, ExpressibleByArgument, CaseIterable {
        case junit

        func convert() async throws -> String {
            switch self {
            case .junit:
                return try await JUnitXMLBEPConverter()
                    .convert(URL(fileURLWithPath: "/Users/test/bep.bin"))
                    .display()
            }
        }
    }
}
