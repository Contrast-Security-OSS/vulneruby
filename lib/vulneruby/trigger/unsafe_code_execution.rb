# frozen_string_literal: true

module Vulneruby
  module Trigger
    # Invoke methods which are susceptible to Unsafe Code Execution.
    class UnsafeCodeExecution
      # Run the command Kernel#eval to expose a vulnerable method call.
      #
      # @param ruby_code [String] the code to execute
      def self.run_kernel_eval ruby_code
        Kernel.eval(ruby_code)
      rescue StandardError => _e
        'Invalid code'
      end
    end
  end
end
