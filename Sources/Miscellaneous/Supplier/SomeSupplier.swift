// MARK: - SomeSupplier

/// An implementation of `Supplier` that simply stores its handler.
@_fixed_layout
public struct SomeSupplier<Supplied> where Supplied: Handler {
	/// Wrap `supplied` into a `SomeSupplier`.
	///
	/// - parameter supplied: The handler to be wrapped.
	@inlinable
	public init(_ supplied: Supplied) {
		self.supplied = supplied
	}

	/// The handler.
	public var supplied: Supplied
}

// MARK: - SomeSupplier: Supplier

extension SomeSupplier: Supplier { }

public extension SomeSupplier {
	/* associatedtype Supplied where Supplied: Handler */

	/* var supplied: Supplied { get set } */
}
