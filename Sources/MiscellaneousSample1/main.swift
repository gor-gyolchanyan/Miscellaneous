import Miscellaneous

let logger = SomeHandler<String> {
	print($0)
	return true
}

_ = logger.handle("Hello, world!")
