# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reveille/version'

Gem::Specification.new do |spec|
  spec.name          = "reveille"
  spec.version       = Reveille::VERSION
  spec.authors       = ["Dan Ryan"]
  spec.email         = ["dan@appliedawesome.com"]
  spec.description   = %q{Command-line interface for Reveille.io}
  spec.summary       = %q{Command-line interface for Reveille.io}
  spec.homepage      = "http://reveille.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "clamp"
  spec.add_dependency "cabin"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
