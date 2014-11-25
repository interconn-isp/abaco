require 'spec_helper'

RSpec.describe Numeric do
  describe '#to_italian' do
    it 'converts the number into Italian' do
      Abaco::Converter
        .expects(:convert)
        .with(10)
        .once
        .returns('test')

      expect(10.to_italian).to eq('test')
    end
  end
end
