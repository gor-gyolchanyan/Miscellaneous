// MARK: - Weak: ExpressibleByNilLiteral

extension Weak: ExpressibleByNilLiteral { }

public extension Weak {
	@inlinable
	public init(nilLiteral: ()) {
		self.init(nil)
	}
}
