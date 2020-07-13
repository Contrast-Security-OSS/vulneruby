# frozen_string_literal: true

module Vulneruby
  module Trigger
    # Invoke methods which are susceptible to Untrusted Deserialization
    class UntrustedDeserialization
      # Run the command Marshal#load to expose a vulnerable method call.
      #
      # @param marshal_string [String] the marshal data to load
      def self.run_marshal_load marshal_string
        Marshal.load(marshal_string)
      rescue StandardError => _e
        'Invalid marshal data'
      end
    end
  end
end
