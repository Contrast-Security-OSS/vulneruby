# frozen_string_literal: true

require 'openssl'

module Vulneruby
  module Trigger
    # Invoke methods which are susceptible to Crypto Bad Cipher
    class CryptoBadCipher
      # Run the command  OpenSSL::Cipher.new to expose a vulnerable method call.
      def self.run_bad_cipher
        OpenSSL::Cipher.new("BF")
      end
    end
  end
end
