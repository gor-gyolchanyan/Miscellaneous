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
		unimplemented()
	}

	@usableFromInline
	internal var unexpired: Unexpired? {
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
