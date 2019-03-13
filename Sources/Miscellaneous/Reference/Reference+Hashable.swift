// MARK: - Reference: Hashable

extension Reference: Hashable where Instance: Hashable { }

public extension Reference where Instance: Hashable {
	@inlinable
	func hash(into hasher: inout Hasher) {
		hasher.combine(self.instance)
	}
}
