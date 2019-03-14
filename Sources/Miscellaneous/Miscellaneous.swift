public typealias ReferenceArray<Unexpired> = ExpiringArray<Reference<Unexpired>> where Unexpired: AnyObject
public typealias WeakArray<Unexpired> = ExpiringArray<Weak<Unexpired>>

@inlinable
public func unimplemented(file: StaticString = #file, line: UInt = #line) -> Never {
	fatalError("unimplemented", file: file, line: line)
}
