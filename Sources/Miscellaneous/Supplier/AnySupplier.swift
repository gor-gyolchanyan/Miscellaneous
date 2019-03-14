//
// This is free and unencumbered software released into the public domain.
//
// Anyone is free to copy, modify, publish, use, compile, sell, or
// distribute this software, either in source code form or as a compiled
// binary, for any purpose, commercial or non-commercial, and by any
// means.
//
// In jurisdictions that recognize copyright laws, the author or authors
// of this software dedicate any and all copyright interest in the
// software to the public domain. We make this dedication for the benefit
// of the public at large and to the detriment of our heirs and
// successors. We intend this dedication to be an overt act of
// relinquishment in perpetuity of all present and future rights to this
// software under copyright law.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
// OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.
//
// For more information, please refer to <http://unlicense.org/>
//

// MARK: - AnySupplier

/// An implementation of `Supplier` which type-erases an instance of arbitrary `Supplier` implementation.
@_fixed_layout
public struct AnySupplier<Supplied> where Supplied: Handler {
	@inlinable
	internal init(core: AnySupplierCore<Supplied>) {
		self.core = core
	}

	@usableFromInline
	internal var core: AnySupplierCore<Supplied>
}

public extension AnySupplier {
	/// Wrap `base` into `AnySupplier`.
	///
	/// - parameter base: The instance of `Supplier` to be wrapped.
	@inlinable
	init<Base>(_ base: Base) where Base: Supplier, Base.Supplied == Supplied {
		self.init(core: SupplierCore(base))
	}
}

// MARK: - AnySupplier: Supplier

extension AnySupplier: Supplier { }

public extension AnySupplier {
	/* associatedtype Supplied where Supplied: Handler */

	var supplied: Supplied {
		@inlinable
		get {
			return self.core.supplied
		}

		@inlinable
		set {
			self.mutating()
			self.core.supplied = newValue
		}
	}
}

// MARK: - AnySupplier (Details)

internal extension AnySupplier {
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
internal class AnySupplierCore<Supplied> {
	@inlinable
	init() { }

	@inlinable
	deinit { }

	@inlinable
	internal func copy() -> AnySupplierCore<Supplied> {
		unimplemented()
	}

	@usableFromInline
	internal var supplied: Supplied {
		@inlinable
		get {
			unimplemented()
		}

		@inlinable
		set {
			unimplemented()
		}
	}
}

// MARK: - SupplierCore

@_fixed_layout
@usableFromInline
internal final class SupplierCore<Base>: AnySupplierCore<Base.Supplied> where Base: Supplier {
	@inlinable
	internal init(_ base: Base) {
		self.base = base
	}

	@inlinable
	deinit { }

	@usableFromInline
	internal var base: Base

	@inlinable
	internal override func copy() -> AnySupplierCore<Base.Supplied> {
		return SupplierCore(self.base)
	}

	@usableFromInline
	internal override var supplied: Base.Supplied {
		@inlinable
		get {
			return self.base.supplied
		}

		@inlinable
		set {
			self.base.supplied = newValue
		}
	}
}
