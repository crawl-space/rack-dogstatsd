# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/dogstatsd/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-dogstatsd"
  spec.version       = Rack::DogStatsd::VERSION
  spec.authors       = ["James Bowes", "Pieter Mulder"]
  spec.email         = ["jbowes@repl.ca", "pieter.mulder@wooga.net"]

  spec.summary       = %q{Rack middleware for dogstatsd}
  spec.description   = %q{Rack middleware for dogstatsd}
  spec.homepage      = "https://github.com/wooga/rack-dogstatsd"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'dogstatsd-ruby', '~> 4', '>= 4.8.1'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
