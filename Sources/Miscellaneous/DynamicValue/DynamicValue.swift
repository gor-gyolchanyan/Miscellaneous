// MARK: - DynamicValue

/// A dynamic wrapper around a value of a static type.
@_fixed_layout
public struct DynamicValue {
	/// Wraps a value and its static type into a dynamic wrapper. Fails if the value is not of the specified static type.
	///
	/// - parameter value: The value to be wrapped.
	/// - parameter staticType: The dynamic wrapper around the static type of the value.
	@inlinable
	public init?(_ value: Any, of staticType: DynamicType) {
		guard staticType.isOfThisType(value) else {
			return nil
		}
		self.value = value
		self.staticType = staticType
	}

	/// Wraps a value into a dynamic wrapper.
	///
	/// - parameter value: The value to be wrapped.
	@inlinable
	public init<Value>(_ value: Value) {
		self.value = value
		self.staticType = .init(Value.self)
	}

	/// The wrapped value.
	public var value: Any

	/// The dynamic wrapper of the value's static type.
	public var staticType: DynamicType
}
