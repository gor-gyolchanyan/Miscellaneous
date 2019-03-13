// MARK: - ReferenceKind: LosslessStringConvertible

extension ReferenceKind: LosslessStringConvertible { }

public extension ReferenceKind {
	@inlinable
	init?(_ description: String) {
		switch description {
		case ReferenceKind.strongDescription:
			self = .strong
		case ReferenceKind.weakDescription:
			self = .weak
		default:
			return nil
		}
	}
}
