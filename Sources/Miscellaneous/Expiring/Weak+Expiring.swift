// MARK: - Weak: Expiring

extension Weak: Expiring { }

public extension Weak {
	typealias Unexpired = Instance

	var unexpired: Unexpired? {
		@inlinable
		get {
			return self.instance
		}

		@inlinable
		set {
			self.instance = newValue
		}
	}
}
