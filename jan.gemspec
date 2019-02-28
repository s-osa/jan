lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jan/version'

Gem::Specification.new do |spec|
  spec.name          = 'jan'
  spec.version       = Jan::VERSION
  spec.authors       = ['OSA Shunsuke']
  spec.email         = ['hhelibebcnofnenamg@gmail.com']
  spec.summary       = %q{JAN utility gem}
  spec.description   = %q{JAN utility gem}
  spec.homepage      = 'https://github.com/s-osa/jan'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
