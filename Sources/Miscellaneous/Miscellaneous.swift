@inlinable
public func unimplemented(file: StaticString = #file, line: UInt = #line) -> Never {
	fatalError("unimplemented", file: file, line: line)
}
