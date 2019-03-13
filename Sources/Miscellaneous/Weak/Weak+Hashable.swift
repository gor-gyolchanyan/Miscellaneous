// MARK: - Weak: Hashable

extension Weak: Hashable where Instance: Hashable { }

public extension Weak where Instance: Hashable {
	@inlinable
	func hash(into hasher: inout Hasher) {
		hasher.combine(self.instance)
	}
}
