// MARK: - ExpiringArray: RangeReplaceableCollection

extension ExpiringArray: RangeReplaceableCollection where TheExpiring: ExpressibleByNilLiteral { }

public extension ExpiringArray where TheExpiring: ExpressibleByNilLiteral {
	@inlinable
	init() {
		self.init(elements: .init())
	}

	@inlinable
	mutating func replaceSubrange<NewElements>(_ subrange: Range<Index>, with newElements: NewElements) where NewElements: Collection, NewElements.Element == Element {
		self.elements.replaceSubrange(subrange, with: newElements.lazy.map { TheExpiring($0) })
	}
}
