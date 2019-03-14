//
// This is free and unencumbered software released into the public domain.
//
// Anyone is free to copy, modify, publish, use, compile, sell, or
// distribute this software, either in source code form or as a compiled
// binary, for any purpose, commercial or non-commercial, and by any
// means.
//
// In jurisdictions that recognize copyright laws, the author or authors
// of this software dedicate any and all copyright interest in the
// software to the public domain. We make this dedication for the benefit
// of the public at large and to the detriment of our heirs and
// successors. We intend this dedication to be an overt act of
// relinquishment in perpetuity of all present and future rights to this
// software under copyright law.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
// OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.
//
// For more information, please refer to <http://unlicense.org/>
//

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
