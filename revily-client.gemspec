# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'revily/client/version'

Gem::Specification.new do |spec|
  spec.name          = 'revily-client'
  spec.version       = Revily::Client::VERSION
  spec.authors       = ['Dan Ryan']
  spec.email         = ['hi@revi.ly']
  spec.description   = %q{A library for communicating with the revi.ly service or self-hosted Revily setup.}
  spec.summary   = %q{A library for communicating with the revi.ly service or self-hosted Revily setup.}
  spec.homepage      = 'https://revi.ly'
  spec.license       = 'MIT'

  spec.files = %x{ git ls-files }.split("\n").select { |d| d =~ %r{^(LICENSE|README|CONTRIBUTING|CHANGELOG|bin/|ext/|lib/|spec/|test/)} }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version     = '>= 1.9.3'
  spec.required_rubygems_version = '>= 1.3.6'
  
  spec.add_dependency 'cabin', '~> 0.6'
  spec.add_dependency 'clamp', '~> 0.6'
  spec.add_dependency 'faraday', '~> 0.8'
  spec.add_dependency 'faraday_middleware', '~> 0.9'
  spec.add_dependency 'hashie', '~> 2.0'
  spec.add_dependency 'multi_json', '~> 1.7'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'guard-rspec', '>= 3.0.2'
  spec.add_development_dependency 'guard-spork'
  spec.add_development_dependency 'libnotify'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rb-fsevent'
  spec.add_development_dependency 'rb-inotify'
  spec.add_development_dependency 'rspec', '>= 2.13.0'
  spec.add_development_dependency 'ruby_gntp'
  spec.add_development_dependency 'webmock', '>= 1.13.0'
end