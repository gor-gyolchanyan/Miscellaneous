// MARK: - Weak: CustomDebugStringConvertible

extension Weak: CustomDebugStringConvertible { }

public extension Weak {
	@inlinable
	var debugDescription: String {
		let instanceDescription: String
		if let instance = self.instance {
			instanceDescription = String(reflecting: instance)
		} else {
			instanceDescription = "nil"
		}
		return "Weak<\(Instance.self)>(\(instanceDescription))"
	}
}
