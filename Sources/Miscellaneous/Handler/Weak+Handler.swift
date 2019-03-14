// MARK: - Weak: Handler

extension Weak: Handler where Instance: Handler { }

public extension Weak where Instance: Handler {
	typealias Handled = Instance.Handled

	mutating func handle(_ handled: Handled) {
		self.instance.handle(handled)
	}
}
