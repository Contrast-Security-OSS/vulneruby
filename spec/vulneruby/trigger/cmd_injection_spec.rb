# frozen_string_literal: true

require('vulneruby/trigger/cmd_injection')

describe Vulneruby::Trigger::CmdInjection do
  describe '.run_system' do
    it 'will run Kernel#`' do
      expect(Kernel).to(receive(:`))
      described_class.run_system('ls')
    end
  end
end
