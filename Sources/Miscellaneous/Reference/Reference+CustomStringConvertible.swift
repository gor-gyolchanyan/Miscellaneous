// MARK: - Reference: CustomStringConvertible

extension Reference: CustomStringConvertible { }

public extension Reference {
	@inlinable
	var description: String {
		let instanceDescription: String
		if let instance = self.instance {
			instanceDescription = "\(instance) of type \(Instance.self)"
		} else {
			instanceDescription = "expired \(Instance.self)"
		}
		return "\(self.kind) reference to \(instanceDescription)"
	}
}
