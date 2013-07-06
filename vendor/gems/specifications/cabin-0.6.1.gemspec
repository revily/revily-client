# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "cabin"
  s.version = "0.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jordan Sissel"]
  s.date = "2013-06-18"
  s.description = "This is an experiment to try and make logging more flexible and more consumable. Plain text logs are bullshit, let's emit structured and contextual logs. Metrics, too!"
  s.email = ["jls@semicomplete.com"]
  s.executables = ["rubygems-cabin-test"]
  s.files = ["bin/rubygems-cabin-test"]
  s.homepage = "https://github.com/jordansissel/ruby-cabin"
  s.licenses = ["Apache License (2.0)"]
  s.require_paths = ["lib", "lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Experiments in structured and contextual logging"
end
