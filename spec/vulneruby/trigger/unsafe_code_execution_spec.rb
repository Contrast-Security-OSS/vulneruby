# frozen_string_literal: true

require 'vulneruby/trigger/unsafe_code_execution'

describe Vulneruby::Trigger::UnsafeCodeExecution do
  describe '.run_kernel_eval' do
    it 'will run Kernel#eval' do
      expect(Kernel).to(receive(:eval))
      described_class.run_kernel_eval('2+2')
    end

    it 'can catch exception' do
      expect(Kernel).to receive(:eval).and_raise(StandardError)
      expect { described_class.run_kernel_eval('puts asdf') }.not_to raise_error
    end
  end
end
