// MARK: - Weak

/// A weak reference to a class instance or a copy of a value-type instance.
@_fixed_layout
public struct Weak<Instance> {
	@inlinable
	public init(_ instance: Instance?) {
		self.reference = Weak.wrap(instance)
	}

	@usableFromInline
	internal var reference: Reference<AnyObject>
}

public extension Weak {
	/// The wrapped instance.
	var instance: Instance? {
		@inlinable
		get {
			return Weak.unwrap(self.reference)
		}

		@inlinable
		set {
			self.reference = Weak.wrap(newValue)
		}
	}
}
