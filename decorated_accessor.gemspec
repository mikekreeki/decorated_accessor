# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'decorated_accessor/version'

Gem::Specification.new do |spec|
  spec.name          = "decorated_accessor"
  spec.version       = DecoratedAccessor::VERSION
  spec.authors       = ["Michal Krejčí"]
  spec.email         = ["me@mikekreeki.com"]
  spec.description   = %q{}
  spec.summary       = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "actionpack", ">= 3.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-rails", "~> 2.14"
end
