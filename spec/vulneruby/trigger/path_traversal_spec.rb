# frozen_string_literal: true

require 'vulneruby/trigger/path_traversal'

describe Vulneruby::Trigger::PathTraversal do
  describe '.run_file_read' do
    it 'will run File#read' do
      expect(File).to(receive(:read))
      described_class.run_file_read('/some/path')
    end

    it 'can catch exception' do
      expect(File).to receive(:read).and_raise(StandardError)
      expect { described_class.run_file_read(nil) }.to_not raise_error
    end
  end
end
