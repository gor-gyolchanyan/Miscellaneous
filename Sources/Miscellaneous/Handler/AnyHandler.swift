// MARK: - AnyHandler

/// An implementation of `Handler` which type-erases an instance of arbitrary `Handler` implementation.
@_fixed_layout
public struct AnyHandler<Handled> {
	@inlinable
	internal init(core: AnyHandlerCore<Handled>) {
		self.core = core
	}

	@usableFromInline
	internal var core: AnyHandlerCore<Handled>
}

public extension AnyHandler {
	/// Wrap `base` into `AnyHandler`.
	///
	/// - parameter base: The instance of `Handler` to be wrapped.
	@inlinable
	init<Base>(_ base: Base) where Base: Handler, Base.Handled == Handled {
		self.init(core: HandlerCore(base))
	}
}

// MARK: - AnyHandler: Handler

extension AnyHandler: Handler { }

public extension AnyHandler {
	/* associatedtype Handled */

	@inlinable
	mutating func handle(_ handled: Handled) {
		self.mutating()
		self.core.handle(handled)
	}
}

// MARK: - AnyHandler (Details)

internal extension AnyHandler {
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
internal class AnyHandlerCore<Handled> {
	@inlinable
	init() { }

	@inlinable
	deinit { }

	@inlinable
	internal func copy() -> AnyHandlerCore<Handled> {
		fatalError()
	}

	@inlinable
	internal func handle(_ handled: Handled) {
		fatalError()
	}
}

// MARK: - HandlerCore

@_fixed_layout
@usableFromInline
internal final class HandlerCore<Base>: AnyHandlerCore<Base.Handled> where Base: Handler {
	@inlinable
	internal init(_ base: Base) {
		self.base = base
	}

	@inlinable
	deinit { }

	@usableFromInline
	internal var base: Base

	@inlinable
	internal override func copy() -> AnyHandlerCore<Base.Handled> {
		return HandlerCore(self.base)
	}

	@inlinable
	internal override func handle(_ handled: Base.Handled) {
		self.base.handle(handled)
	}
}
