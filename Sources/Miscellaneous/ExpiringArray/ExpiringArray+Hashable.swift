// MARK: - ExpiringArray: Hashable

extension ExpiringArray: Hashable where TheExpiring: Hashable { }

public extension ExpiringArray where TheExpiring: Hashable {
	@inlinable
	func hash(into hasher: inout Hasher) {
		hasher.combine(self.elements)
	}
}
