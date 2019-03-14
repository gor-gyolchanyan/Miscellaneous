//
// This is free and unencumbered software released into the public domain.
//
// Anyone is free to copy, modify, publish, use, compile, sell, or
// distribute this software, either in source code form or as a compiled
// binary, for any purpose, commercial or non-commercial, and by any
// means.
//
// In jurisdictions that recognize copyright laws, the author or authors
// of this software dedicate any and all copyright interest in the
// software to the public domain. We make this dedication for the benefit
// of the public at large and to the detriment of our heirs and
// successors. We intend this dedication to be an overt act of
// relinquishment in perpetuity of all present and future rights to this
// software under copyright law.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
// OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.
//
// For more information, please refer to <http://unlicense.org/>
//

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
