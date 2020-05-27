module Vulneruby
  module Trigger
    class CmdInjection
      def self.run_system command_arg
        Kernel.system(command_arg)
      end
    end
  end
end