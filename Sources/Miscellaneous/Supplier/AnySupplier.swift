// MARK: - AnySupplier

/// An implementation of `Supplier` which type-erases an instance of arbitrary `Supplier` implementation.
public struct AnySupplier<Supplied> where Supplied: Handler {
	private init(core: AnySupplierCore<Supplied>) {
		self.core = core
	}

	private var core: AnySupplierCore<Supplied>
}

public extension AnySupplier {
	/// Wrap `base` into `AnySupplier`.
	///
	/// - parameter base: The instance of `Supplier` to be wrapped.
	init<Base>(_ base: Base) where Base: Supplier, Base.Supplied == Supplied {
		self.init(core: SupplierCore(base))
	}
}

// MARK: - AnySupplier: Supplier

extension AnySupplier: Supplier { }

public extension AnySupplier {
	/* associatedtype Supplied where Supplied: Handler */

	var supplied: Supplied {
		get {
			return self.core.supplied
		}

		set {
			self.mutating()
			self.core.supplied = newValue
		}
	}
}

// MARK: - AnySupplier (Details)

fileprivate extension AnySupplier {
	mutating func mutating() {
		if isKnownUniquelyReferenced(&self.core) {
			self.core = self.core.copy()
		}
	}
}

// MARK: - Any  Core

fileprivate class AnySupplierCore<Supplied> {
	fileprivate func copy() -> AnySupplierCore<Supplied> {
		fatalError()
	}

	fileprivate var supplied: Supplied {
		get {
			fatalError()
		}

		set {
			fatalError()
		}
	}
}

// MARK: - SupplierCore

fileprivate final class SupplierCore<Base>: AnySupplierCore<Base.Supplied> where Base: Supplier {
	fileprivate init(_ base: Base) {
		self.base = base
	}

	private var base: Base

	fileprivate override func copy() -> AnySupplierCore<Base.Supplied> {
		return SupplierCore(self.base)
	}

	fileprivate override var supplied: Base.Supplied {
		get {
			return self.base.supplied
		}

		set {
			self.base.supplied = newValue
		}
	}
}
