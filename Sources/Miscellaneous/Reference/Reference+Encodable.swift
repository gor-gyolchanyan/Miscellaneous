// MARK: - Reference: Encodable

extension Reference: Encodable where Instance: Encodable { }

public extension Reference where Instance: Encodable {
	@inlinable
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: Reference.CodingKeys.self)
		try container.encode(self.kind, forKey: .kind)
		try container.encode(self.instance, forKey: .instance)
	}
}
