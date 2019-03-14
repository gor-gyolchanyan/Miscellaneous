// MARK: - ExpiringArray: RandomAccessCollection & MutableCollection

extension ExpiringArray: RandomAccessCollection & MutableCollection { }

public extension ExpiringArray {
	typealias Index = Int
	typealias Element = Unexpired?

	@inlinable
	var startIndex: Index {
		return self.elements.startIndex
	}

	@inlinable
	var endIndex: Index {
		return self.elements.endIndex
	}

	@inlinable
	func index(_ index: Index, offsetBy distance: Int) -> Index {
		return self.elements.index(index, offsetBy: distance)
	}

	subscript(_ index: Index) -> Element {
		@inlinable
		get {
			return self.elements[index].unexpired
		}

		@inlinable
		set {
			self.elements[index].unexpired = newValue
		}
	}
}
