// MARK: - Handler

/// A type that can handle things.
public protocol Handler {
	/// The type of thing that can be handled.
	associatedtype Handled
	/// Handle a thing.
	///
	/// - parameter handled: The thing to be handled.
	mutating func handle(_ handled: Handled)
}
