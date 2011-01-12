version = File.read(File.expand_path('../../VERSION', __FILE__)).strip
tag     = "v#{version}"
name    = 'sambot'
gem     = "dist/#{name}-#{version}.gem"
gemspec = "#{name}.gemspec"

directory 'dist'

task :clean do
  rm_f(gem)
end

task :update_version do
  file = 'lib/tattletail.rb'
  ruby = File.read(file)

  major, minor, tiny, pre = version.split('.')
  pre = pre ? pre.inspect : 'nil'

  ruby.gsub!(/^(\s*)MAJOR = .*?$/, "\\1MAJOR = #{major}")
  raise("Could not insert MAJOR in #{file}") unless $1

  ruby.gsub!(/^(\s*)MINOR = .*?$/, "\\1MINOR = #{minor}")
  raise("Could not insert MINOR in #{file}") unless $1

  ruby.gsub!(/^(\s*)TINY  = .*?$/, "\\1TINY  = #{tiny}")
  raise("Could not insert TINY in #{file}") unless $1

  ruby.gsub!(/^(\s*)PRE   = .*?$/, "\\1PRE   = #{pre}")
  raise("Could not insert PRE in #{file}") unless $1

  File.open(file, 'w') { |f| f << ruby }
end

desc "Build #{name} gem"
task :build => %w(clean update_version dist) do
  sh("gem build #{gemspec} && mv #{name}-#{version}.gem dist/")
end

desc "Install the #{name} gem"
task :install => :build do
  sh("gem install #{gem}")
end

desc "Push the #{name} gem to RubyGems"
task :push => :build do
  sh("gem push #{gem}")
end
