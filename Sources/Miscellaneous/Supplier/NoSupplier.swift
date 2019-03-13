// MARK: - NoSupplier

/// An implementation of `Supplier` that has no handler.
public struct NoSupplier<Handled> { }

// MARK: - NoSupplier: Supplier

extension NoSupplier: Supplier { }

public extension NoSupplier {
	typealias Supplied = NoHandler<Handled>

	public var supplied: Supplied {
		get {
			return .init()
		}

		set {
			// This is intentionally left blank.
		}
	}
}
