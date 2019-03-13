// MARK: - DynamicType

/// A dynamic wrapper around a static type.
@_fixed_layout
public struct DynamicType {
	/// Wraps a static type into a dynamic wrapper.
	///
	/// - parameter _: The static type to be wrapped (the dynamic type is ignored).
	@inlinable
	public init<Value>(_: Value.Type) {
		self.value = Value.self
		self.isOfThisType = { $0 is Value }
	}

	/// The wrapped type.
	public var value: Any.Type

	@usableFromInline
	internal let isOfThisType: (Any) -> Bool
}
