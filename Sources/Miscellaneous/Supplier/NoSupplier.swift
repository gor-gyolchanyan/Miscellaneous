// MARK: - NoSupplier

/// An implementation of `Supplier` that has no handler.
@_fixed_layout
public struct NoSupplier<Handled> {
	@inlinable
	public init() { }
}

// MARK: - NoSupplier: Supplier

extension NoSupplier: Supplier { }

public extension NoSupplier {
	typealias Supplied = NoHandler<Handled>

	public var supplied: Supplied {
		@inlinable
		get {
			return .init()
		}

		@inlinable
		set {
			// This is intentionally left blank.
		}
	}
}
