# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doneyo/version'

Gem::Specification.new do |spec|
  spec.name          = 'doneyo'
  spec.version       = Doneyo::VERSION
  spec.authors       = ['Shintaro Kojima']
  spec.email         = ['goodies@codeout.net']
  spec.summary       = "Yo you when it's done"
  spec.description   = "Yo you when time-consuming shell commands are done."
  spec.homepage      = "https://github.com/codeout/doneyo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject{|f| f =~ /^go\// }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
