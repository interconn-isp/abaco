require 'spec_helper'

RSpec.describe Abaco::Converter do
  subject { described_class }

  describe '.convert' do
    {
      34.5 => 'trentaquattro/50',
      34.05 => 'trentaquattro/05',
      7 => 'sette/00',
      17 => 'diciassette/00',
      27 => 'ventisette/00',
      100 => 'cento/00',
      107 => 'centosette/00',
      110 => 'centodieci/00',
      127 => 'centoventisette/00',
      1199 => 'millecentonovantanove/00',
      17634 => 'diciassettemilaseicentotrentaquattro/00',
      1973431 => 'un milione novecentosettantatremilaquattrocentotrentuno/00',
      1999197431 => 'un miliardo novecentonovantanove milioni centonovantasettemilaquattrocentotrentuno/00',
      999999999999 => 'novecentonovantanove miliardi novecentonovantanove milioni novecentonovantanovemilanovecentonovantanove/00'
    }.each_pair do |number, result|
      it "converts #{number} as '#{result}'" do
        expect(subject.convert(number)).to eq(result)
      end
    end

    it 'raises an error for numbers > 999.999.999.999' do
      expect {
        subject.convert(10**12)
      }.to raise_error(Abaco::Converter::BigNumberError)
    end
  end
end
