//
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

// MARK: - HandlerQueue

@_fixed_layout
public struct HandlerQueue<Element> where Element: Handler {
	@usableFromInline
	internal typealias Elements = [Element]

	@inlinable
	internal init(elements: Elements) {
		self.elements = elements
	}

	@usableFromInline
	internal var elements: Elements
}

public extension HandlerQueue {
	@inlinable
	public init() {
		self.init(elements: .init())
	}

	@inlinable
	func isEnqueued(where predicate: (Element) throws -> Bool) rethrows -> Bool {
		return try self.elements.firstIndex(where: predicate) != nil
	}

	@inlinable
	mutating func enqueue(_ element: Element) {
		self.elements.append(element)
	}

	@inlinable
	mutating func dequeue(where predicate: (Element) throws -> Bool) rethrows -> Element? {
		guard let elementIndex = try self.elements.firstIndex(where: predicate) else {
			return nil
		}
		return self.elements.remove(at: elementIndex)
	}
}

public extension HandlerQueue where Element: Equatable {
	@inlinable
	func isEnqueued(_ element: Element) -> Bool {
		return isEnqueued { $0 == element }
	}

	@inlinable
	mutating func dequeue(_ element: Element) -> Element? {
		return self.dequeue { $0 == element }
	}
}
