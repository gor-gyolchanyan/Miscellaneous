// MARK: - Optional: Supplier

extension Optional: Supplier where Wrapped: Supplier { }

public extension Optional where Wrapped: Supplier {
	typealias Supplied = Wrapped.Supplied?

	var supplied: Supplied {
		get {
			return self?.supplied
		}

		set {
			if let newValue = newValue {
				self?.supplied = newValue
			} else {
				self = nil
			}
		}
	}
}
