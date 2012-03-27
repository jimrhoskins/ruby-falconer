Gem::Specification.new do |s|
  s.name        = 'falconer'
  s.version     = '0.0.0'
  s.date        = '2012-03-26'
  s.summary     = 'Falconer Server'
  s.description = 'Falconer Event Endpoint for Ruby and Rack'
  s.authors     = ['Jim Hoskins']
  s.email       = 'jim@jimhoskins.com'
  s.files       = ['lib/falconer.rb']
  s.homepage    = 'http://jimhoskins.com'

	s.add_runtime_dependency 'json', '~> 1.5'
end
