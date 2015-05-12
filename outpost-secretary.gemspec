# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'outpost/secretary/version'

Gem::Specification.new do |spec|
  spec.name          = "outpost-secretary"
  spec.version       = Outpost::Secretary::VERSION
  spec.authors       = ["Bryan Ricker"]
  spec.email         = ["bricker88@gmail.com"]
  spec.description   = "secretary-rails integration with Outpost."
  spec.summary       = "Provides views and controllers for" \
                       "secretary-rails integration with Outpost."
  spec.homepage      = "https://github.com/SCPR/outpost-secretary"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "outpost-cms", ['>= 0.0.1', "< 1"]
  spec.add_dependency "secretary-rails", ['>= 1.0.0', "< 3"]
end
