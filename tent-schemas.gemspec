# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = 'tent-schemas'
  gem.version       = '0.1.0'
  gem.authors       = ['Jonathan Rudenberg']
  gem.email         = ['jonathan@titanous.com']
  gem.description   = 'Tent protocol JSON schemas'
  gem.summary       = 'Tent protocol JSON schemas'
  gem.homepage      = 'http://tent.io'

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'json-schema'
end
