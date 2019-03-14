// MARK: - ExpiringArray: ExpressibleByArrayLiteral

extension ExpiringArray: ExpressibleByArrayLiteral where TheExpiring: ExpressibleByNilLiteral { }

public extension ExpiringArray where TheExpiring: ExpressibleByNilLiteral {
	typealias ArrayLiteralElement = Element

	@inlinable
	init(arrayLiteral elements: ArrayLiteralElement...) {
		self.init(elements: elements.map { TheExpiring($0) })
	}
}
