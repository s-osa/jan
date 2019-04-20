require 'spec_helper'

describe Jan::Symbol do
  let(:symbol) { described_class.new('4901085188033') }

  describe 'initializer' do
    it { expect(symbol).to be_an_instance_of Jan::Symbol }
  end

  describe '#band_patterns' do
    it { expect(symbol.band_patterns).to be_an_instance_of Array }
    it { expect(symbol.band_patterns).to all( be_an Jan::Symbol::BandPattern) }

    it 'has correct format' do
      patterns = symbol.band_patterns

      expect(patterns[0]).to be_an_instance_of Jan::Symbol::BandPattern::LeftQuietZone
      expect(patterns[1]).to be_an_instance_of Jan::Symbol::BandPattern::NormalGuardPattern
      expect(patterns[2..7]).to all( be_an Jan::Symbol::BandPattern::SymbolCharacter )
      expect(patterns[8]).to be_an_instance_of Jan::Symbol::BandPattern::CenterGuardPattern
      expect(patterns[9..14]).to all( be_an Jan::Symbol::BandPattern::SymbolCharacter )
      expect(patterns[15]).to be_an_instance_of Jan::Symbol::BandPattern::NormalGuardPattern
      expect(patterns[16]).to be_an_instance_of Jan::Symbol::BandPattern::RightQuietZone
    end

    # it 'has correctly-encoded symbol characters' do
    #   symbol_characters = symbol.band_patterns.grep(Jan::Symbol::BandPattern::SymbolCharacter)

    #   expect(symbol_character[0]).to eq Jan::Symbol::BandPattern.new('kk
    # end
  end
end
