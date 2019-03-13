// MARK: - DynamicType: CustomDebugStringConvertible

extension DynamicType: CustomDebugStringConvertible { }

public extension DynamicType {
	@inlinable
	var debugDescription: String {
		return "DynamicType(\(String(reflecting: self.value)).self)"
	}
}
