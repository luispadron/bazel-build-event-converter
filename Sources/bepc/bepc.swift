import BEPConverter

@main
struct Bepc {
    static func main() async throws {
        let converter = BepConverter()
        let input = "Hello, world!"
        let output = converter.convert(input)
        print(output)
    }
}
