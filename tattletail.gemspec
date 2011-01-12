version = File.read(File.expand_path('../VERSION', __FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'tattletail'
  s.version     = version
  s.summary     = 'Captures output from a shell and sends it to a web-interface along with relevant files.'
  s.description = 'A ruby gem to capture the output from a shell and send it to a web-interface along with gisting relevant files. For use with assisting in debugging code and practices. A tool for remote pairing.'

  s.required_ruby_version = '>= 1.9.2'

  s.authors  = ['Johnneylee Jack Rollins', 'Samuel Kadolph']
  s.email    = ['spaceghost@amberlampdesign.com', 'samuel@kadolph.com']
  s.homepage = 'https://github.com/Spaceghost/Tattletail'

  s.files        = Dir['CHANGELOG', 'lib/**/*', 'LICENSE', 'README']
  s.require_path = 'lib'

  s.executables        = ['tattletail']
  s.default_executable = 'tattletail'
end
