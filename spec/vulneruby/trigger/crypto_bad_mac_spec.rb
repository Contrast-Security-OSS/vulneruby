# frozen_string_literal: true

require 'vulneruby/trigger/crypto_bad_mac'

describe Vulneruby::Trigger::CryptoBadMac do
  describe '.run_digest_md5' do
    it 'will run Digest::MD5.new' do
      expect(Digest::MD5).to(receive(:new))
      described_class.run_digest_mdg
    end
  end
end
