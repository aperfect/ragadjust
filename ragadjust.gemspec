# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ragadjust/version'

Gem::Specification.new do |spec|
  spec.name          = "ragadjust"
  spec.version       = Ragadjust::VERSION
  spec.authors       = ["Adam Perfect"]
  spec.email         = ["gems@adamperfect.com"]
  spec.summary       = "Apply rag-adjustment to HTML content"
  spec.description   = "Gem to rag-adjust text content based on Mark Boulton's 24ways article: http://24ways.org/2013/run-ragged/ and Nathan Ford's JS implementation: https://github.com/nathanford/ragadjust"
  spec.homepage      = "https://github.com/aperfect/ragadjust"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "nokogiri"
end
