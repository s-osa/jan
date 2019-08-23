require 'spec_helper'

describe Jan::Symbol do
  let(:symbol13) { described_class.new('4901085188033') }
  let(:symbol8) { described_class.new('49377415') }

  describe 'initializer' do
    it { expect(symbol13).to be_an_instance_of Jan::Symbol }
    it { expect(symbol8).to be_an_instance_of Jan::Symbol }
  end

  describe '#band_patterns' do
    it { expect(symbol13.band_patterns).to be_an_instance_of Array }
    it { expect(symbol8.band_patterns).to be_an_instance_of Array }
    it { expect(symbol13.band_patterns).to all( be_an Jan::Symbol::BandPattern) }
    it { expect(symbol8.band_patterns).to all( be_an Jan::Symbol::BandPattern) }

    it 'has correct format' do
      patterns = symbol13.band_patterns

      expect(patterns[0]).to be_an_instance_of Jan::Symbol::BandPattern::LeftQuietZone
      expect(patterns[1]).to be_an_instance_of Jan::Symbol::BandPattern::NormalGuardPattern
      expect(patterns[2..7]).to all( be_an Jan::Symbol::BandPattern::SymbolCharacter )
      expect(patterns[8]).to be_an_instance_of Jan::Symbol::BandPattern::CenterGuardPattern
      expect(patterns[9..14]).to all( be_an Jan::Symbol::BandPattern::SymbolCharacter )
      expect(patterns[15]).to be_an_instance_of Jan::Symbol::BandPattern::NormalGuardPattern
      expect(patterns[16]).to be_an_instance_of Jan::Symbol::BandPattern::RightQuietZone

      patterns = symbol8.band_patterns

      expect(patterns[0]).to be_an_instance_of Jan::Symbol::BandPattern::LeftQuietZone
      expect(patterns[1]).to be_an_instance_of Jan::Symbol::BandPattern::NormalGuardPattern
      expect(patterns[2..5]).to all( be_an Jan::Symbol::BandPattern::SymbolCharacter )
      expect(patterns[6]).to be_an_instance_of Jan::Symbol::BandPattern::CenterGuardPattern
      expect(patterns[7..10]).to all( be_an Jan::Symbol::BandPattern::SymbolCharacter )
      expect(patterns[11]).to be_an_instance_of Jan::Symbol::BandPattern::NormalGuardPattern
      expect(patterns[12]).to be_an_instance_of Jan::Symbol::BandPattern::RightQuietZone
    end
  end

  describe '#codepoints' do
    mappings = {
      '0123456789012' => %w[A1 A2 A3 A4 A5 A6 C7 C8 C9 C0 C1 C2],
      '1123456789012' => %w[A1 A2 B3 A4 B5 B6 C7 C8 C9 C0 C1 C2],
      '2123456789012' => %w[A1 A2 B3 B4 A5 B6 C7 C8 C9 C0 C1 C2],
      '3123456789012' => %w[A1 A2 B3 B4 B5 A6 C7 C8 C9 C0 C1 C2],
      '4123456789012' => %w[A1 B2 A3 A4 B5 B6 C7 C8 C9 C0 C1 C2],
      '5123456789012' => %w[A1 B2 B3 A4 A5 B6 C7 C8 C9 C0 C1 C2],
      '6123456789012' => %w[A1 B2 B3 B4 A5 A6 C7 C8 C9 C0 C1 C2],
      '7123456789012' => %w[A1 B2 A3 B4 A5 B6 C7 C8 C9 C0 C1 C2],
      '8123456789012' => %w[A1 B2 A3 B4 B5 A6 C7 C8 C9 C0 C1 C2],
      '9123456789012' => %w[A1 B2 B3 A4 B5 A6 C7 C8 C9 C0 C1 C2],
      '12345678' => %w[A1 A2 A3 A4 C5 C6 C7 C8],
    }

    mappings.each do |code, answer|
      it 'returns codepoints with correct set' do
        symbol = described_class.new(code)
        expect(symbol.codepoints).to eq answer
      end
    end
  end

  describe '#svg' do
    it 'returns SVG string'
  end
end
