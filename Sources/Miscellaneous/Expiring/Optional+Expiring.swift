// MARK: - Optional: Expiring

extension Optional: Expiring { }

public extension Optional {
	typealias Unexpired = Wrapped

	var unexpired: Unexpired? {
		get {
			return self
		}

		set {
			self = newValue
		}
	}
}
