# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'powered_wunderground/version'

Gem::Specification.new do |s|
  s.name          = 'powered_wunderground'
  s.version       = PoweredWunderground::VERSION
  s.authors       = ['Daniel Carneiro']
  s.email         = ['danielrcarneiro@gmail.com']

  s.summary       = 'Wunderground API wrapper on steroids'
  s.homepage      = 'https://github.com/dcarneiro/powered_wunderground'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if s.respond_to?(:metadata)
  #   s.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.bindir        = 'exe'
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-reporters'

  s.add_development_dependency 'bundler', '~> 1.9'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'pry-byebug'
end
