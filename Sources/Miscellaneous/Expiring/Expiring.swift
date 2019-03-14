// MARK: - Expiring

/// A type that stores somehting that might expire.
public protocol Expiring {
	/// The type of thing that can be stored.
	associatedtype Unexpired

	/// The thing that is stored.
	var unexpired: Unexpired? { get set }
}

public extension Expiring where Self: ExpressibleByNilLiteral {
	@inlinable
	init(_ unexpired: Unexpired? = nil) {
		self.init(nilLiteral: ())
		self.unexpired = unexpired
	}
}
