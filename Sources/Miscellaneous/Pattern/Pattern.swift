//
//
// This is free and unencumbered software released into the public domain.
//
// Anyone is free to copy, modify, publish, use, compile, sell, or
// distribute this software, either in source code form or as a compiled
// binary, for any purpose, commercial or non-commercial, and by any
// means.
//
// In jurisdictions that recognize copyright laws, the author or authors
// of this software dedicate any and all copyright interest in the
// software to the public domain. We make this dedication for the benefit
// of the public at large and to the detriment of our heirs and
// successors. We intend this dedication to be an overt act of
// relinquishment in perpetuity of all present and future rights to this
// software under copyright law.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
// OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.
//
// For more information, please refer to <http://unlicense.org/>
//  

// MARK: - Pattern

@_fixed_layout
public struct Pattern<Sample> where Sample: RangeReplaceableCollection {
	@inlinable
	public init(elements: [Element]) {
		self.elements = elements
	}

	@usableFromInline
	internal var elements: [Element]
}

#warning("Delete the following code when migrating to Swift 5.")
#if true

// MARK: - Pattern.Element

public extension Pattern {
	enum Element {
		case literal(Sample)
		case variable(Identifier)
		case pattern(Pattern<Sample>)
	}
}

// MARK: - Pattern.Element: CustomStringConvertible

extension Pattern.Element: CustomStringConvertible { }

public extension Pattern.Element {
	var description: String {
		switch self {
		case .literal(let sample):
			return "literal \(String(reflecting: sample))"
		case .variable(let identifier):
			return "variable \(identifier)"
		case .pattern(let pattern):
			return "\(pattern)"
		}
	}
}

// MARK: - Pattern.Element: Equatable

extension Pattern.Element: Equatable where Sample: Equatable { }

public extension Pattern.Element where Sample: Equatable {
	@inlinable
	static func == (_ some: Pattern.Element, _ other: Pattern.Element) -> Bool {
		switch (some, other) {
		case (.literal(let some), .literal(let other)):
			return some == other
		case (.variable(let some), .variable(let other)):
			return some == other
		case (.pattern(let some), .pattern(let other)):
			return some == other
		default:
			return false
		}
	}
}

// MARK: - Pattern.Element: Hashable

extension Pattern.Element: Hashable where Sample: Hashable { }

public extension Pattern.Element where Sample: Hashable {
	@inlinable
	func hash(into hasher: inout Hasher) {
		hasher.combine(self.kind)
		switch self {
		case .literal(let literal):
			hasher.combine(literal)
		case .variable(let identifier):
			hasher.combine(identifier)
		case .pattern(let pattern):
			hasher.combine(pattern)
		}
	}
}

// MARK: - Pattern.Element: Encodable

extension Pattern.Element: Encodable where Sample: Encodable { }

public extension Pattern.Element where Sample: Encodable {
	@inlinable
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(self.kind, forKey: .kind)
		switch self {
		case .literal(let literal):
			try container.encode(literal, forKey: .content)
		case .variable(let identifier):
			try container.encode(identifier, forKey: .content)
		case .pattern(let pattern):
			try container.encode(pattern, forKey: .content)
		}
	}
}

// MARK: - Pattern.Element: Decodable

extension Pattern.Element: Decodable where Sample: Decodable { }

public extension Pattern.Element where Sample: Decodable {
	@inlinable
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		switch try container.decode(Kind.self, forKey: .kind) {
		case .literal:
			self = .literal(try container.decode(Sample.self, forKey: .content))
		case .variable:
			self = .variable(try container.decode(Pattern.Identifier.self, forKey: .content))
		case .pattern:
			self = .pattern(try container.decode(Pattern<Sample>.self, forKey: .content))
		}
	}
}

// MARK: - Pattern.Element (Details)

internal extension Pattern.Element {
	@usableFromInline
	enum CodingKeys: CodingKey {
		case kind
		case content
	}

	@usableFromInline
	enum Kind: String, Hashable, Codable {
		case literal
		case variable
		case pattern
	}

	@usableFromInline
	var kind: Kind {
		@inlinable
		get {
			switch self {
			case .literal:
				return .literal
			case .variable:
				return .variable
			case .pattern:
				return .pattern
			}
		}
	}
}

#endif
