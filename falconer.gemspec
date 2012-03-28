lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'falconer/version'

Gem::Specification.new do |s|
  s.name        = 'falconer'
  s.version     = Falconer::VERSION
  s.summary     = 'Falconer Server'
  s.description = 'Falconer Event Endpoint for Ruby and Rack'
  s.authors     = ['Jim Hoskins']
  s.email       = 'jim@jimhoskins.com'
  s.files       = Dir.glob("{lib}/**/*")
	s.require_path = 'lib'
  s.homepage    = 'https://github.com/jimrhoskins/ruby-falconer'

	s.add_runtime_dependency 'json', '~> 1.5'

	s.add_dependency 'rails', '~> 3.2.2'
	s.add_development_dependency 'sqlite3'
end
