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
