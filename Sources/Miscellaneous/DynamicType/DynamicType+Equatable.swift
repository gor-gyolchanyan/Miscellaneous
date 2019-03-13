// MARK: - DynamicType: Equatable

extension DynamicType: Equatable { }

public extension DynamicType {
	@inlinable
	static func == (_ some: DynamicType, _ other: DynamicType) -> Bool {
		return ObjectIdentifier(some.value) == ObjectIdentifier(other.value)
	}
}
