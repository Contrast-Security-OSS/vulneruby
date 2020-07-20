# frozen_string_literal: true

require 'vulneruby/trigger/crypto_weak_randomness'

describe Vulneruby::Trigger::CryptoWeakRandomness do
  describe '.run_rand' do
    it 'will run Kernel#rand' do
      expect(Kernel).to(receive(:rand))
      described_class.run_rand
    end
  end
end
