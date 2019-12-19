# frozen_string_literal: true

require_relative 'lib/concerns'

Gem::Specification.new do |gem|
  gem.add_dependency 'rails', '>= 6.0'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rubocop', '>= 0.78'
  gem.add_development_dependency 'rubocop-ordered_methods'

  gem.authors     = ['Martin Streicher']
  gem.bindir      = 'exe'
  gem.description = 'A Rails generator to subdivide models into small files, usable with Zeitwerk'
  gem.email       = ['martin.streicher@gadget.consulting']
  gem.executables = gem.files.grep(%r{^exe/}) { |f| File.basename(f) }

  # Specify what files should be added to the gem when it is released
  # The `git ls-files -z` loads the files in the RubyGem that have been added to git
  gem.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  gem.homepage                    = 'https://github.com/gadgetonline/concerns'
  gem.license                     = 'MIT'
  gem.metadata['changelog_uri']   = 'https://github.com/gadgetonline/concerns/blob/master/CHANGELOG.md'
  gem.metadata['homepage_uri']    = gem.homepage
  gem.metadata['source_code_uri'] = 'https://github.com/gadgetonline/concerns'
  gem.name                        = 'concerns'
  gem.require_paths               = ['lib']
  gem.required_ruby_version       = Gem::Requirement.new('>= 2.3.0')
  gem.summary                     = 'A Rails generator to make modular models'
  gem.version                     = Concerns::VERSION
end
