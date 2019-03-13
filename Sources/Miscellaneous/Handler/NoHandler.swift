// MARK: - NoHandler

/// An implementation of `Handler` that does nothing when handling things.
@_fixed_layout
public struct NoHandler<Handled> { }

// MARK: - NoHandler: Handler

extension NoHandler: Handler { }

public extension NoHandler {
	/* associatedtype Handled */

	@inlinable
	func handle(_ handled: Handled) {
		// This is intentionally left blank.
	}
}
