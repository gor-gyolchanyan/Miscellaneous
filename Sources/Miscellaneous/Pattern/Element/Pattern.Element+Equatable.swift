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

#warning("Enable the following code when migrating to Swift 5.")
#if false

// MARK: - Pattern.Element: Equatable

extension Pattern.Element: Equatable where Sample: Equatable { }

public extension Pattern.Element where Sample: Equatable {
	@inlinable
	static func == (_ some: Pattern.Element, _ other: Pattern.Element) -> Bool {
		switch (some, other) {
		case (.literal(let some), .literal(let other)):
			return some == other
		case (.variable(let some), .variable(let other)):
			return some == other
		case (.pattern(let some), .pattern(let other)):
			return some == other
		default:
			return false
		}
	}
}

#endif
