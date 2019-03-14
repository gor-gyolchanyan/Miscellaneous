// MARK: - NoExpiring

/// An implementation of `Expiring` that has no handler.
public struct NoExpiring<Unexpired> { }

// MARK: - NoExpiring: Expiring

extension NoExpiring: Expiring { }

public extension NoExpiring {
	/* associatedtype Unexpired */

	public var unexpired: Unexpired? {
		get {
			return nil
		}

		set {
			// This is intentionally left blank.
		}
	}
}
