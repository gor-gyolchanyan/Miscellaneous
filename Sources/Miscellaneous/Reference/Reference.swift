// MARK: - Reference

/// A wrapper around a class instance that can dynamically change between strong and weak.
@_fixed_layout
public struct Reference<Instance> where Instance: AnyObject {
	@inlinable
	internal init(_ box: Box) {
		self.box = box
	}

	@usableFromInline
	internal var box: Box
}

public extension Reference {
	/// Wraps an instance into a reference.
	///
	/// - parameter instance: The instance to be wrapped.
	/// - parameter kind: The kind of reference to wrap the instance into.
	@inlinable
	init(_ instance: Instance? = nil, kind: ReferenceKind = .strong) {
		self.init(Box(instance, kind: kind))
	}

	/// Wraps an instance into a weak reference.
	///
	/// - parameter instance: The instance to be wrapped.
	@inlinable
	init(weak instance: Instance?) {
		self.init(instance, kind: .weak)
	}

	/// The wrapped instance.
	var instance: Instance? {
		@inlinable
		get {
			return self.box.instance
		}

		@inlinable
		set {
			self.box.instance = newValue
		}
	}

	/// The kind of reference.
	var kind: ReferenceKind {
		@inlinable
		get {
			return self.box.kind
		}

		@inlinable
		set {
			self.box.kind = newValue
		}
	}
}
