# frozen_string_literal: true

require 'vulneruby/trigger/reflection_injection'

describe Vulneruby::Trigger::ReflectionInjection do
  describe '.run_const_get' do
    it 'will run Object#const_get' do
      expect(Object).to(receive(:const_get))
      described_class.run_const_get(:ENV)
    end
  end
end
