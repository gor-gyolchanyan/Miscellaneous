// MARK: - SomeHandler

/// An implementation of `Handler` that handles things using a supplied function.
@_fixed_layout
public struct SomeHandler<Handled> {
	/// Wrap `function` into a `SomeHandler`.
	///
	/// - parameter function: The function to be wrapped.
	@inlinable
	public init(_ function: @escaping (Handled) -> Void) {
		self.function = function
	}

	/// The function to be used in order to handle things.
	public var function: (Handled) -> Void
}

// MARK: - SomeHandler: Handler

extension SomeHandler: Handler { }

public extension SomeHandler {
	/* associatedtype Handled */

	@inlinable
	func handle(_ handled: Handled) {
		self.function(handled)
	}
}
