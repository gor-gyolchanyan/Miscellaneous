// MARK: - ExpiringArray: Decodable

extension ExpiringArray: Decodable where TheExpiring: Decodable { }

public extension ExpiringArray where TheExpiring: Decodable {
	@inlinable
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		self.init(elements: try container.decode(Elements.self))
	}
}
