
// MARK: - ReferenceKind: Encodable

extension ReferenceKind: Encodable { }

public extension ReferenceKind {
	@inlinable
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(String(describing: self))
	}
}
