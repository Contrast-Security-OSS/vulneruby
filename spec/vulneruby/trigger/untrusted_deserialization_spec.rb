# frozen_string_literal: true

require 'vulneruby/trigger/untrusted_deserialization'

describe Vulneruby::Trigger::UntrustedDeserialization do
  let(:data) { Marshal.dump('asdf') }

  describe '.run_marshal_load' do
    it 'will run Marhsal#load' do
      expect(Marshal).to(receive(:load))
      described_class.run_marshal_load(data)
    end

    it 'can catch exception' do
      expect(Marshal).to receive(:load).and_raise(StandardError)
      expect { described_class.run_marshal_load('bad_string') }.
          not_to raise_error
    end
  end
end
