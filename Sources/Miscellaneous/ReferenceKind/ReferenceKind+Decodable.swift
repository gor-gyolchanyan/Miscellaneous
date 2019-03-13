
// MARK: - ReferenceKind: Decodable

extension ReferenceKind: Decodable { }

public extension ReferenceKind {
	@inlinable
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let description = try container.decode(String.self)
		guard let instance = ReferenceKind(description) else {
			throw DecodingError.dataCorruptedError(in: container, debugDescription: "\(String(reflecting: description)) is not a valid reference kind")
		}
		self = instance
	}
}
