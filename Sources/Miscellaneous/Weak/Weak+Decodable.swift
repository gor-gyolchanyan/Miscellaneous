// MARK: - Weak: Decodable

extension Weak: Decodable where Instance: Decodable { }

public extension Weak where Instance: Decodable {
	@inlinable
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let instance = try container.decode(Instance?.self)
		self.init(instance)
	}
}
