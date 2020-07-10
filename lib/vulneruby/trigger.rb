# frozen_string_literal: true

module Vulneruby
  # Top level module wrapping all of our "Triggers" - methods which are
  # vulnerable to exploitation if called with unsafe user input.
  module Trigger
  end
end
require_relative './trigger/cmd_injection'
require_relative './trigger/path_traversal'
require_relative './trigger/reflection_injection'
require_relative './trigger/ssrf'
require_relative './trigger/xxe'
