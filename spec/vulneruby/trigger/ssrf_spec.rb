# frozen_string_literal: true

require('net/http')
require('uri')
require('vulneruby/trigger/ssrf')

describe Vulneruby::Trigger::Ssrf do
  let(:uri) { 'http://foo.com?bar=baz' }

  describe '.run_net_get' do
    it 'will run Net::HTTP#get' do
      expect(Net::HTTP).to(receive(:get).with(URI(uri)))
      described_class.run_net_get(uri)
    end
  end
end
