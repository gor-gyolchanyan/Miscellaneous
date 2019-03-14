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

#warning("Delete the following code when migrating to Swift 5.")
#if true

// MARK: - Reference.Box

internal extension Reference {
	@usableFromInline
	enum Box {
		case strong(Strong)
		case weak(Weak)
	}
}

internal extension Reference.Box {
	@inlinable
	init(_ instance: Instance?, kind: ReferenceKind) {
		switch kind {
		case .strong:
			self = .strong(.init(instance))
		case .weak:
			self = .weak(.init(instance))
		}
	}

	@usableFromInline
	var instance: Instance? {
		@inlinable
		get {
			switch self {
			case .strong(let box):
				return box.instance
			case .weak(let box):
				return box.instance
			}
		}

		@inlinable
		set {
			switch self.kind {
			case .strong:
				self = .strong(.init(newValue))
			case .weak:
				self = .weak(.init(newValue))
			}
		}
	}

	@usableFromInline
	var kind: ReferenceKind {
		@inlinable
		get {
			switch self {
			case .strong:
				return .strong
			case .weak:
				return .weak
			}
		}

		@inlinable
		set {
			let instance = self.instance
			switch newValue {
			case .strong:
				self = .strong(.init(instance))
			case .weak:
				self = .weak(.init(instance))
			}
		}
	}
}

// MARK: - Reference.Box.Strong

internal extension Reference.Box {
	@_fixed_layout
	@usableFromInline
	struct Strong {
		@inlinable
		internal init(_ instance: Instance?) {
			self.instance = instance
		}

		@usableFromInline
		internal var instance: Instance?
	}
}

// MARK: - Reference.Box.Weak

internal extension Reference.Box {
	@_fixed_layout
	@usableFromInline
	struct Weak {
		@inlinable
		internal init(_ instance: Instance?) {
			self.instance = instance
		}

		@usableFromInline
		internal weak var instance: Instance?
	}
}

#endif
