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
