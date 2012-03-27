require 'rake/testtask'

Rake::TestTask.new do |t|
	t.pattern = 'spec/**/*_spec.rb'
	t.libs << 'spec'
	t.libs << 'lib'
end

desc "Run Specs"
task :spec => :test
task :default => :spec
