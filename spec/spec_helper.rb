# frozen_string_literal: true

require 'bundler/setup'
require 'simplecov'

SimpleCov.minimum_coverage(99)
SimpleCov.start do
  add_filter '/spec/'
end

require 'vulneruby'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expose_dsl_globally = true

  config.expect_with(:rspec) do |c|
    c.syntax = :expect
  end
end
