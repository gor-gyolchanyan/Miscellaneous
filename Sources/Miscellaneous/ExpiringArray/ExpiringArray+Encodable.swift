// MARK: - ExpiringArray: Encodable

extension ExpiringArray: Encodable where TheExpiring: Encodable { }

public extension ExpiringArray where TheExpiring: Encodable {
	@inlinable
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(self.elements)
	}
}
