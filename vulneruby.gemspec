# frozen_string_literal: true

require_relative('lib/vulneruby/version')

# Add those dependencies required to develop or test the project
def self.add_dev_dependencies spec
  spec.add_development_dependency('rspec', '~> 3.0')
  spec.add_development_dependency('rubocop', '0.83.0')
  spec.add_development_dependency('rubocop-performance', '1.5.2')
  spec.add_development_dependency('rubocop-rspec', '1.39.0')
  spec.add_development_dependency('simplecov', '~> 0.18.5')
end

# Add those dependencies required to run the project
def self.add_dependencies spec
  spec.add_dependency('rake', '~> 12.0')
  spec.add_dependency('nokogiri')
end

# Get all the files that belong to this Gem, using Git.
def self.gemfiles
  Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.
        split("\x0").
        reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
end

Gem::Specification.new do |spec|
  spec.name          = 'vulneruby'
  spec.version       = Vulneruby::VERSION
  spec.authors       = ['Donald Propst']
  spec.email         = [
    'donald.propst@contrastsecurity.com',
    'ruby@contrastsecurity.com'
  ]

  spec.summary       = 'Used in the Contrast Security vulnerable ruby '\
                       'applications to share common functionality across '\
                       'ruby projects'

  spec.homepage      = 'https://github.com/Contrast-Security-OSS/vulneruby'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Contrast-Security-OSS/vulneruby'
  spec.metadata['changelog_uri'] = 'https://github.com/Contrast-Security-OSS/vulneruby'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added
  # into git.

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  add_dev_dependencies(spec)
  add_dependencies(spec)
  spec.files = gemfiles
end
