// MARK: - AnyExpiring

/// An implementation of `Expiring` which type-erases an instance of arbitrary `Expiring` implementation.
@_fixed_layout
public struct AnyExpiring<Unexpired> {
	@inlinable
	internal init(core: AnyExpiringCore<Unexpired>) {
		self.core = core
	}

	@usableFromInline
	internal var core: AnyExpiringCore<Unexpired>
}

public extension AnyExpiring {
	/// Wrap `base` into `AnyExpiring`.
	///
	/// - parameter base: The instance of `Expiring` to be wrapped.
	@inlinable
	init<Base>(_ base: Base) where Base: Expiring, Base.Unexpired == Unexpired {
		self.init(core: ExpiringCore(base))
	}
}

// MARK: - AnyExpiring: Expiring

extension AnyExpiring: Expiring { }

public extension AnyExpiring {
	/* associatedtype Unexpired where Unexpired: Handler */

	var unexpired: Unexpired? {
		@inlinable
		get {
			return self.core.unexpired
		}

		@inlinable
		set {
			self.mutating()
			self.core.unexpired = newValue
		}
	}
}

// MARK: - AnyExpiring (Details)

internal extension AnyExpiring {
	@inlinable
	mutating func mutating() {
		if isKnownUniquelyReferenced(&self.core) {
			self.core = self.core.copy()
		}
	}
}

// MARK: - Any  Core

@_fixed_layout
@usableFromInline
internal class AnyExpiringCore<Unexpired> {
	@inlinable
	init() { }

	@inlinable
	deinit { }

	@inlinable
	internal func copy() -> AnyExpiringCore<Unexpired> {
		fatalError()
	}

	@usableFromInline
	internal var unexpired: Unexpired? {
		@inlinable
		get {
			fatalError()
		}

		@inlinable
		set {
			fatalError()
		}
	}
}

// MARK: - ExpiringCore

@_fixed_layout
@usableFromInline
internal final class ExpiringCore<Base>: AnyExpiringCore<Base.Unexpired> where Base: Expiring {
	@inlinable
	internal init(_ base: Base) {
		self.base = base
	}

	@inlinable
	deinit { }

	@usableFromInline
	internal var base: Base

	@inlinable
	internal override func copy() -> AnyExpiringCore<Base.Unexpired> {
		return ExpiringCore(self.base)
	}

	@usableFromInline
	internal override var unexpired: Base.Unexpired? {
		@inlinable
		get {
			return self.base.unexpired
		}

		@inlinable
		set {
			self.base.unexpired = newValue
		}
	}
}
