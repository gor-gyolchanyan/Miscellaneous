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

// MARK: - Pattern (Analysis)

public extension Pattern {
	@_fixed_layout
	struct AnalysisContext {
		public enum Variable {
			case length(Int)
		}

		@inlinable
		public init(variables: [Identifier: Variable], areEquivalent: @escaping (Sample.Element, Sample.Element) -> Bool) {
			self.variables = variables
			self.areEquivalent = areEquivalent
		}

		public var variables: [Identifier: Variable]
		public var areEquivalent: (Sample.Element, Sample.Element) -> Bool
	}

	typealias AnalysisResult = [Identifier: Sample]

	@inlinable
	func analyze(_ sample: Sample, using context: AnalysisContext)-> AnalysisResult {
		var result = AnalysisResult()
		var sample = sample[...]
		Pattern.analyze(pattern: self, in: &sample, using: context, result: &result)
		return result
	}
}

public extension Pattern.AnalysisContext where Sample.Element: Equatable {
	@inlinable
	public init(variables: [Pattern.Identifier: Variable]) {
		self.init(variables: variables) { $0 == $1 }
	}
}

internal extension Pattern {
	@inlinable
	static func analyze(pattern: Pattern<Sample>, in sample: inout Sample.SubSequence, using context: AnalysisContext, result: inout AnalysisResult) {
		for element in pattern.elements {
			self.analyze(element: element, in: &sample, using: context, result: &result)
		}
	}

	@inlinable
	static func analyze(element: Element, in sample: inout Sample.SubSequence, using context: AnalysisContext, result: inout AnalysisResult) {
		switch element {
		case .literal(let literal):
			self.analyze(literal: literal, in: &sample, using: context, result: &result)
		case .variable(let variable):
			self.analyze(variable: variable, in: &sample, using: context, result: &result)
		case .pattern(let pattern):
			self.analyze(pattern: pattern, in: &sample, using: context, result: &result)
		}
	}

	@inlinable
	static func analyze(literal: Sample, in sample: inout Sample.SubSequence, using context: AnalysisContext, result: inout AnalysisResult) {
		if sample.starts(with: literal, by: context.areEquivalent) {
			sample.removeFirst(literal.count)
		}
	}

	@inlinable
	static func analyze(variable identifier: Identifier, in sample: inout Sample.SubSequence, using context: AnalysisContext, result: inout AnalysisResult) {
		guard let variable = context.variables[identifier] else {
			return
		}
		switch variable {
			case .length(let length):
				let literal = Sample(sample.prefix(length))
				sample.removeFirst(literal.count)
				result[identifier, default: .init()].append(contentsOf: literal)
		}
	}
}
