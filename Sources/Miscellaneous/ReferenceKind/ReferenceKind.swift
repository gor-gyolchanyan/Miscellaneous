// MARK: - ReferenceKind

/// The kind of a reference.
public enum ReferenceKind: Hashable {
	/// The reference is a strong reference (prevents the instance from expiring).
	case strong
	/// The reference is a weak reference (doesn't prevent the instance from expiring).
	case weak
}
