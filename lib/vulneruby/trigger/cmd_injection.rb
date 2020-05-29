# frozen_string_literal: true

module Vulneruby
  module Trigger
    # Invoke methods which are susceptible to CMD Injection.
    class CmdInjection
      # Run the command Kernel#` to expose a vulnerable method call.
      #
      # @param command_arg [String] the command to execute
      def self.run_system command_arg
        Kernel.`(command_arg)
      end
    end
  end
end
