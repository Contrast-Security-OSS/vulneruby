# frozen_string_literal: true

require 'vulneruby/trigger/crypto_bac_cipher'

describe Vulneruby::Trigger::CryptoBadCipher do
  describe '.run_bad_cipher' do
    it 'will run OpenSSL::Cipher.new' do
      expect(OpenSSL::Cipher).to(receive(:new))
      described_class.run_bad_cipher
    end
  end
end
