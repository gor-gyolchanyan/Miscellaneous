// MARK: - ExpiringArray: Equatable

extension ExpiringArray: Equatable where TheExpiring: Equatable { }

public extension ExpiringArray where TheExpiring: Equatable {
	@inlinable
	static func == (_ some: ExpiringArray, _ other: ExpiringArray) -> Bool {
		return some.elements == other.elements
	}
}
