module Vulneruby
  module Trigger
    class CmdInjection
      def self.run_system command_arg
        Kernel.`(command_arg)
      end
    end
  end
end