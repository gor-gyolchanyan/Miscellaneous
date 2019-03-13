// MARK: - Weak: CustomStringConvertible

extension Weak: CustomStringConvertible { }

public extension Weak {
	@inlinable
	var description: String {
		if let instance = self.instance {
			return "weak \(instance) of type \(Instance.self)"
		} else {
			return "expired weak \(Instance.self)"
		}
	}
}
