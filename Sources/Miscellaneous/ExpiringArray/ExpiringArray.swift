// MARK: - ExpiringArray

@_fixed_layout
public struct ExpiringArray<TheExpiring> where TheExpiring: Expiring {
	@usableFromInline
	internal typealias Elements = Array<TheExpiring>

	@inlinable
	internal init(elements: Elements) {
		self.elements = elements
	}

	@usableFromInline
	internal var elements: Elements
}

public extension ExpiringArray {
	typealias CompactView = LazyMapCollection<LazyFilterCollection<LazyMapCollection<Array<TheExpiring>, TheExpiring.Unexpired?>>, TheExpiring.Unexpired>

	@inlinable
	func compacted() -> CompactView {
		return self.elements.lazy.compactMap { $0.unexpired }
	}

	@inlinable
	mutating func compact() {
		self.elements.removeAll { $0.unexpired == nil }
	}
}
