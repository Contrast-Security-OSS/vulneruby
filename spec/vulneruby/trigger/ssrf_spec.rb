# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'vulneruby/trigger/ssrf'

describe Vulneruby::Trigger::Ssrf do
  let(:uri) { 'http://foo.com?bar=baz' }

  describe '.run_net_get' do
    context 'when the URI is valid' do
      let(:expected) { '<html/>' }

      it 'will run Net::HTTP#get' do
        allow(Net::HTTP).to(
            receive(:get).
                with(URI(uri)).
                and_return(expected))
        result = described_class.run_net_get(uri)
        expect(result).to(eq(expected))
      end
    end

    context 'when the URI is invalid' do
      let(:expected) { "#{ uri } did not respond to get request" }

      it 'will run Net::HTTP#get and catch the error' do
        expect(Net::HTTP).to(
            receive(:get).
                with(URI(uri)).
                and_raise(Errno::ECONNREFUSED))
        result = described_class.run_net_get(uri)
        expect(result).to(eq(expected))
      end
    end
  end
end
