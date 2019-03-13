// MARK: - Supplier

/// A type that can supply things.
public protocol Supplier {
	/// The type of handler to handle things that are supplied.
	associatedtype Supplied where Supplied: Handler

	/// The handler to handle things that are supplied.
	var supplied: Supplied { get set }
}
