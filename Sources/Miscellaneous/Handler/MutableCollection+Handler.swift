// MARK: - MutableCollection: Handler

public extension MutableCollection where Element: Handler {
	typealias Handled = Element.Handled

	@inlinable
	mutating func handle(_ handled: Handled) {
		for index in self.indices {
			self[index].handle(handled)
		}
	}
}

extension Array: Handler where Element: Handler { }
extension ArraySlice: Handler where Element: Handler { }
extension CollectionOfOne: Handler where Element: Handler { }
extension ContiguousArray: Handler where Element: Handler { }
extension Dictionary.Values: Handler where Element: Handler { }
extension EmptyCollection: Handler where Element: Handler { }
extension Slice: Handler where Base: MutableCollection, Base.Element: Handler { }
extension UnsafeMutableBufferPointer: Handler where Element: Handler { }

extension ExpiringArray: Handler where TheExpiring.Unexpired: Handler { }
