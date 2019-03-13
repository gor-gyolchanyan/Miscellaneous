// MARK: - ReferenceKind: CustomStringConvertible

extension ReferenceKind: CustomStringConvertible { }

public extension ReferenceKind {
	@inlinable
	var description: String {
		switch self {
		case .strong:
			return ReferenceKind.strongDescription
		case .weak:
			return ReferenceKind.weakDescription
		}
	}
}
