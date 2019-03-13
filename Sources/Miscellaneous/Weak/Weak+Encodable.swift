// MARK: - Weak: Encodable

extension Weak: Encodable where Instance: Encodable { }

public extension Weak where Instance: Encodable {
	@inlinable
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(self.instance)
	}
}
