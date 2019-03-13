// MARK: - Reference: CustomDebugStringConvertible

extension Reference: CustomDebugStringConvertible { }

public extension Reference {
	@inlinable
	var debugDescription: String {
		let instanceDescription: String
		if let instance = self.instance {
			instanceDescription = String(reflecting: instance)
		} else {
			instanceDescription = "nil"
		}
		return "Reference<\(Instance.self)>(\(instanceDescription), kind: .\(self.kind))"
	}
}
