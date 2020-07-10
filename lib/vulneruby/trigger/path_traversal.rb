# frozen_string_literal: true

module Vulneruby
  module Trigger
    # Invoke methods which are susceptible to Path Traversal.
    class PathTraversal
      # Run the command File#read to expose a vulnerable method call.
      #
      # @param file_path [String] the file to read
      def self.run_file_read file_path
        File.read(file_path)
      rescue StandardError => _e
        'Invalid file path'
      end
    end
  end
end
