# coding: utf-8

begin
  require "./lib/bourbon_integrator/version"
rescue LoadError
  module BourbonIntegrator; VERSION = "0".freeze; end
end

Gem::Specification.new do |spec|
  spec.name          = "bourbon_integrator"
  spec.version       = BourbonIntegrator::VERSION
  spec.authors       = ["Szymon Kopciewski"]
  spec.email         = ["s.kopciewski@gmail.com"]
  spec.summary       = "The tasks for assets managment with bourbon"
  spec.description   = "The tasks for assets managment with bourbon"
  spec.homepage      = "https://github.com/skopciewski/bourbon_integrator"
  spec.license       = "GPL-3.0"

  spec.require_paths = ["lib"]
  spec.files         = Dir.glob("{bin,lib,data}/**/*") + \
                       %w(Gemfile LICENSE README.md CHANGELOG.md)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }

  spec.add_runtime_dependency "piko_model", "~>1"
  spec.add_runtime_dependency "bourbon", "~>4"
  spec.add_runtime_dependency "neat"
  spec.add_runtime_dependency "bitters"
  spec.add_runtime_dependency "sass-globbing", "1.1.5"
  spec.add_runtime_dependency "mustache"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "codeclimate-test-reporter"
end
