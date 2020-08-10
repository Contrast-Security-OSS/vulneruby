# frozen_string_literal: true

module Vulneruby
  module Trigger
    # Invoke a regex that can cause a regex dos.
    class RegexDos
      BAD_REGEX =  /((a)+)*/
      # Run the Regex#match to expose a vulnerable method call.
      #
      # @param data [String] a string to run regex against
      def self.run_regex_match data
        BAD_REGEX.match(data)
      end
    end
  end
end
