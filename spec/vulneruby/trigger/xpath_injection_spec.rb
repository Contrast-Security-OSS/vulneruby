# frozen_string_literal: true

require 'vulneruby/trigger/xpath_injection'

describe Vulneruby::Trigger::XpathInjection do
  describe '.run_xpath' do
    it 'will return a doc with the user data' do
      data = described_class.run_xpath('some_class')
      expect(data).to include('some_class')
    end

    it 'can catch exception' do
      expect(Nokogiri::HTML::DocumentFragment).to receive(:parse).and_raise(StandardError)
      expect { described_class.run_xpath(nil) }.
          not_to raise_error
    end
  end
end
