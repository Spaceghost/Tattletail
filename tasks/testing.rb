require 'rake/testtask'

task :default => :test

desc 'Run unit tests'
Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.pattern = 'test/tattletail/*_test.rb'
  t.verbose = true
  t.warning = true
end
