// MARK: - Reference: ExpressibleByNilLiteral

extension Reference: ExpressibleByNilLiteral { }

public extension Reference {
	@inlinable
	public init(nilLiteral: ()) {
		self.init(nil)
	}
}
