# frozen_string_literal: true

module Vulneruby
  module Trigger
    # Invoke methods which are susceptible to Crypto Bad Mac
    class CryptoBadMac
      # Run the command Digest::MD5.new to expose a vulnerable method call.
      def self.run_digest_md5
        Digest::MD5.new.to_s
      end
    end
  end
end
