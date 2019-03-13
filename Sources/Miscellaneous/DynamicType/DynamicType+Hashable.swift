// MARK: - DynamicType: Hashable

extension DynamicType: Hashable { }

public extension DynamicType {
	@inlinable
	func hash(into hasher: inout Hasher) {
		hasher.combine(ObjectIdentifier(self.value))
	}
}
