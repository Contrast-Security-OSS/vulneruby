# frozen_string_literal: true

require('net/http')
require('uri')

module Vulneruby
  module Trigger
    # Invoke methods which are susceptible to SSRF Injection.
    class SsrfInjection
      # Run the Net::HTTP#get method
      #
      # @param uri [String] the fully qualified URL to attempt to call
      def self.run_net_get uri
        Net::HTTP.get(URI(uri))
      end
    end
  end
end
