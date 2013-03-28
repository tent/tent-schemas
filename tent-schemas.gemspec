# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = 'tent-schemas'
  gem.version       = '0.2.0'
  gem.authors       = ['Jonathan Rudenberg', 'Jesse Stuart']
  gem.email         = ['jonathan@titanous.com', 'jesse@jessestuart.ca']
  gem.description   = 'Tent protocol JSON schemas'
  gem.summary       = 'Tent protocol JSON schemas'
  gem.homepage      = 'https://tent.io'

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'json-schema'
  gem.add_development_dependency 'rake'
end
