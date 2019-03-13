// MARK: - Optional: Handler

extension Optional: Handler where Wrapped: Handler { }

public extension Optional where Wrapped: Handler {
	typealias Handled = Wrapped.Handled

	@inlinable
	mutating func handle(_ handled: Handled) {
		self?.handle(handled)
	}
}
