# frozen_string_literal: true

require 'vulneruby/trigger/xxe'

describe Vulneruby::Trigger::Xxe do
  describe '.substitute_library' do
    it 'will replace marker strings with specified library' do
      result = described_class.substitute_library('FOOBAR')
      expect(result).not_to include('ent')
      expect(result).to include('FOOBAR', 'FOOBAR2')
    end
  end

  describe '.run_nokogiri' do
    let!(:nokogiri_doc_instance) { Nokogiri::XML::Document.new }

    it 'will run Nokogiri::Xml::Document#parse' do
      content = described_class.substitute_library('nokogiri')
      allow(Nokogiri::XML::Document).to receive(:new).
          and_return(nokogiri_doc_instance)
      expect(nokogiri_doc_instance).to receive(:parse).with(content)
      described_class.run_nokogiri
    end

    it 'can safely capture an exception' do
      allow(Nokogiri::XML::Document).to receive(:new).
          and_return(nokogiri_doc_instance)
      allow(nokogiri_doc_instance).to receive(:parse).and_raise(StandardError)
      expect { described_class.run_nokogiri }.not_to raise_error
    end
  end
end
