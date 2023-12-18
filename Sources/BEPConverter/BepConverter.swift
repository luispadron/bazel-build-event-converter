import Foundation
import SwiftBEPParser

public protocol BEPConverter {

    associatedtype Output

    func convert(_ file: URL) async throws -> Output
}
