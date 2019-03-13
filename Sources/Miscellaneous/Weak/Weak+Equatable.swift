// MARK: - Weak: Equatable

extension Weak: Equatable where Instance: Equatable { }

public extension Weak where Instance: Equatable {
	@inlinable
	static func == (_ some: Weak, _ other: Weak) -> Bool {
		return some.instance == other.instance
	}
}
