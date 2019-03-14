// MARK: - Reference: Expiring

extension Reference: Expiring { }

public extension Reference {
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
