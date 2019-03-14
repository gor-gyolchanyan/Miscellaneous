// MARK: - Expiring: Handler

public extension Expiring where Unexpired: Handler {
	typealias Handled = Unexpired.Handled

	@inlinable
	mutating func handle(_ handled: Handled) {
		self.unexpired?.handle(handled)
	}
}

extension Optional: Handler where Unexpired: Handler { }
extension Reference: Handler where Unexpired: Handler { }
extension Weak: Handler where Unexpired: Handler { }
