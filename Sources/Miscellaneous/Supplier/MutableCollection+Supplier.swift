// MARK: - MutableCollection: Supplier

public extension MutableCollection where Element: Supplier {
	typealias Supplied = [Element.Supplied]

	var supplied: Supplied {
		get {
			return self.map { $0.supplied }
		}

		set {
			var supplierIndex = self.startIndex
			var handlerIndex = newValue.startIndex
			while true {
				guard supplierIndex != self.endIndex, handlerIndex != newValue.endIndex else {
					break
				}
				self[supplierIndex].supplied = newValue[handlerIndex]
				supplierIndex = self.index(after: supplierIndex)
				handlerIndex = newValue.index(after: handlerIndex)
			}
		}
	}
}

extension Array: Supplier where Element: Supplier { }
extension ArraySlice: Supplier where Element: Supplier { }
extension CollectionOfOne: Supplier where Element: Supplier { }
extension ContiguousArray: Supplier where Element: Supplier { }
extension Dictionary.Values: Supplier where Element: Supplier { }
extension EmptyCollection: Supplier where Element: Supplier { }
extension Slice: Supplier where Base: MutableCollection, Base.Element: Supplier { }
extension UnsafeMutableBufferPointer: Supplier where Element: Supplier { }
