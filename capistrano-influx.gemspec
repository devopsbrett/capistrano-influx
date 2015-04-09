# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/influx/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-influx"
  spec.version       = Capistrano::Influx::VERSION
  spec.authors       = ["Brett Mack"]
  spec.email         = ["brett.mack@flubit.com"]

  spec.summary       = %q{Store successful deploy info in InfluxDB.}
  spec.description   = %q{Store successful deploy info in InfluxDB.}
  spec.homepage      = "http://github.com/devopsbrett/capistrano-influx"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_runtime_dependency     "influxdb", "~> 0.1"
  spec.add_runtime_dependency     "capistrano", "~> 2.15"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "capistrano-spec", "~> 0.6"
  spec.add_development_dependency "rspec", "~> 3.2"
end
