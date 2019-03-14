Pod::Spec.new do |spec|
	spec.name                       = "Miscellaneous"
	spec.version                    = "0.0.5"
	
	spec.summary                    = "An assortment of miscellaneous goodies for Swift."
	spec.description                = <<-DESC
		Aggregates every useful thing I wrote in Swift that doesn't belong anywhere else.
	DESC
	
	spec.homepage                   = "https://github.com/technogen-gg/Miscellaneous.git"
	spec.license                    = { :type => "Unlicense", :file => "LICENSE.txt" }
	spec.authors                    = { "Gor Gyolchanyan" => "gor.zone@icloud.com" }
	
	spec.source                     = { :git => "https://github.com/technogen-gg/Miscellaneous.git", :tag => "#{spec.version}" }
	spec.source_files               = "Sources", "Sources/**/*.{swift,h,c,cpp,m,mm}"
	
	spec.osx.deployment_target      = '10.14.0'
	spec.ios.deployment_target      = '12.0'
	spec.watchos.deployment_target  = '5.0'
	spec.tvos.deployment_target     = '12.0'

	spec.swift_version = "4.2"
	spec.requires_arc = true
	spec.xcconfig = {  }
end
