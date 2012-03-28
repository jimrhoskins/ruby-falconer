require 'bundler/gem_tasks'
$:.unshift File.expand_path("../lib", __FILE__)
require 'falconer/version'

task :build do
  system "gem build falconer.gemspec"
end

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs << 'spec'
  t.libs << 'lib'
end

desc "Run Specs"
task :spec => :test
task :default => :spec
