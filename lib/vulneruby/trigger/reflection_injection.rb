# frozen_string_literal: true

module Vulneruby
  module Trigger
    # Invoke methods which are susceptible to Path Traversal.
    class ReflectionInjection
      # Run the command Object#const_get to expose a vulnerable method call.
      #
      # @param constant_string [String] the constant to get
      def self.run_const_get constant_string
        Object.const_get(constant_string)
      end
    end
  end
end