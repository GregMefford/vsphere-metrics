# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vsphere/metrics/version'

Gem::Specification.new do |spec|
  spec.name          = "vsphere-metrics"
  spec.version       = Vsphere::Metrics::VERSION
  spec.authors       = ["Greg Mefford"]
  spec.email         = ["greg@gregmefford.com"]
  spec.summary       = "Collects performance metrics from a VMware ESXi host or vCenter Server."
  spec.description   = "Collects performance metrics from a VMware ESXi host or vCenter Server."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rbvmomi"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency 'rspec-given', '~> 3.5'
  spec.add_development_dependency 'webmock', '~> 1.20'
  spec.add_development_dependency 'vcr', '~> 2.9'
end
