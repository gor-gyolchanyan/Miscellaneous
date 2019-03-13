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
