import Miscellaneous

private extension String {
	static let firstName = "firstName"
	static let lastName = "lastName"
}

let fullName: Pattern<String> = [.variable(.firstName), .literal(" "), .variable(.lastName)]
var greeting: Pattern<String> = [.literal("Hello, "), .pattern(fullName), .literal("!")]
print(greeting)

let sample = greeting.evaluate(using: [.firstName: .literal("John"), .lastName: .literal("Doe")])
print("sample", String(reflecting: sample))

print("analysis", greeting.analyze(sample, using: .init(variables: [.firstName: .length(4), .lastName: .length(3)])))
