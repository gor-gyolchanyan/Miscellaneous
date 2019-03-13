// MARK: - Reference: Equatable

extension Reference: Equatable where Instance: Equatable { }

public extension Reference where Instance: Equatable {
	@inlinable
	static func == (_ some: Reference, _ other: Reference) -> Bool {
		return some.instance == other.instance
	}
}
