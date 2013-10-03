# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'helper/version'

Gem::Specification.new do |spec|
  spec.name          = "helper"
  spec.version       = Helper::VERSION
  spec.authors       = ["Tony Pitale"]
  spec.email         = ["tpitale@gmail.com"]
  spec.description   = %q{Helper is a bot built to be helpful.}
  spec.summary       = %q{Helper is a bot built to be helpful.}
  spec.homepage      = "https://github.com/tpitale/helper"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "celluloid-io"
  spec.add_dependency "sparks"
end
