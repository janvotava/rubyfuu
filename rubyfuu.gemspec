# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubyfuu/version'

Gem::Specification.new do |spec|
  spec.name          = "rubyfuu"
  spec.version       = Rubyfuu::VERSION
  spec.authors       = ["Jan Votava"]
  spec.email         = ["votava@deployment.cz"]
  spec.summary       = %q{Brainfuck compiler written in Ruby}
  spec.description   = %q{Brainfuck compiler written in Ruby - highly serious project}
  spec.homepage      = "http://github.com/cyner/rubyfuu"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'thor', '~> 0.19', '>= 0.19.1'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
