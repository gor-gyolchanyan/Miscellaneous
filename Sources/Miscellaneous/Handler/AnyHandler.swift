// MARK: - AnyHandler

/// An implementation of `Handler` which type-erases an instance of arbitrary `Handler` implementation.
public struct AnyHandler<Handled> {
	private init(core: AnyHandlerCore<Handled>) {
		self.core = core
	}

	private var core: AnyHandlerCore<Handled>
}

public extension AnyHandler {
	/// Wrap `base` into `AnyHandler`.
	///
	/// - parameter base: The instance of `Handler` to be wrapped.
	init<Base>(_ base: Base) where Base: Handler, Base.Handled == Handled {
		self.init(core: HandlerCore(base))
	}
}

// MARK: - AnyHandler: Handler

extension AnyHandler: Handler { }

public extension AnyHandler {
	/* associatedtype Handled */

	mutating func handle(_ handled: Handled) {
		self.mutating()
		self.core.handle(handled)
	}
}

// MARK: - AnyHandler (Details)

fileprivate extension AnyHandler {
	mutating func mutating() {
		if isKnownUniquelyReferenced(&self.core) {
			self.core = self.core.copy()
		}
	}
}

// MARK: - Any  Core

fileprivate class AnyHandlerCore<Handled> {
	fileprivate func copy() -> AnyHandlerCore<Handled> {
		fatalError()
	}

	fileprivate func handle(_ handled: Handled) {
		fatalError()
	}
}

// MARK: - HandlerCore

fileprivate final class HandlerCore<Base>: AnyHandlerCore<Base.Handled> where Base: Handler {
	fileprivate init(_ base: Base) {
		self.base = base
	}

	private var base: Base

	fileprivate override func copy() -> AnyHandlerCore<Base.Handled> {
		return HandlerCore(self.base)
	}

	fileprivate override func handle(_ handled: Base.Handled) {
		self.base.handle(handled)
	}
}
