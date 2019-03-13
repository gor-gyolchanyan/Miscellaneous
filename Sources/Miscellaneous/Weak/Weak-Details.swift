// MARK: - Weak (Details)

internal extension Weak {
	@inlinable
	static func wrap(_ unwrapped: Instance?) -> Reference<AnyObject> {
		guard let unwrapped = unwrapped else {
			return .init()
		}
		return .init(unwrapped as AnyObject, kind: type(of: unwrapped) is AnyClass ? .weak : .strong)
	}

	@inlinable
	static func unwrap(_ wrapped: Reference<AnyObject>) -> Instance? {
		guard let wrapped = wrapped.instance else {
			return nil
		}
		return (wrapped as! Instance)
	}
}
