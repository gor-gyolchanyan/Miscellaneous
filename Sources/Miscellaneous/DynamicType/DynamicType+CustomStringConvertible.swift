// MARK: - DynamicType: CustomStringConvertible

extension DynamicType: CustomStringConvertible { }

public extension DynamicType {
	@inlinable
	var description: String {
		return "\(self.value)"
	}
}
