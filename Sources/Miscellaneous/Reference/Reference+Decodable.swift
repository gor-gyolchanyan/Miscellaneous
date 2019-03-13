// MARK: - Reference: Decodable

extension Reference: Decodable where Instance: Decodable { }

public extension Reference where Instance: Decodable {
	@inlinable
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: Reference.CodingKeys.self)
		let kind = try container.decode(ReferenceKind?.self, forKey: .kind) ?? .strong
		let instance = try container.decode(Instance?.self, forKey: .instance)
		self.init(instance, kind: kind)
	}
}
