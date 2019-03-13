// MARK: - DynamicValue: CustomStringConvertible

extension DynamicValue: CustomStringConvertible { }

public extension DynamicValue {
	@inlinable
	var description: String {
		return "\(self.value) of type \(self.staticType)"
	}
}
