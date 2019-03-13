// MARK: - DynamicValue: CustomDebugStringConvertible

extension DynamicValue: CustomDebugStringConvertible { }

public extension DynamicValue {
	@inlinable
	var debugDescription: String {
		return "DynamicValue(\(String(reflecting: self.value)), of: \(String(reflecting: self.staticType)))"
	}
}
