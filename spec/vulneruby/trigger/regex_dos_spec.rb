# frozen_string_literal: true

require 'vulneruby/trigger/regex_dos'

describe Vulneruby::Trigger::RegexDos do
  describe '.run_regex_match' do
    it 'will run Regex#match' do
      expect(described_class::BAD_REGEX).to(receive(:match))
      described_class.run_regex_match('arbitrary regexp operand')
    end
  end
end
