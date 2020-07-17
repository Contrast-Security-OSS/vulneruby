# frozen_string_literal: true

module Vulneruby
  module Trigger
    # Invoke methods which are considered weak random
    class CryptoWeakRandomness
      # Run the command Kernel#rand
      def self.run_rand
        Kernel.rand
      end
    end
  end
end
