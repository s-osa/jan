require 'spec_helper'

describe Jan::Symbol::BandPattern::SymbolCharacter do
  bar = Jan::Symbol::Band::Bar
  space = Jan::Symbol::Band::Space

  set_a_mappings = {
    'A0' => [space.new(3), bar.new(2), space.new(1), bar.new(1)],
    'A1' => [space.new(2), bar.new(2), space.new(2), bar.new(1)],
    'A2' => [space.new(2), bar.new(1), space.new(2), bar.new(2)],
    'A3' => [space.new(1), bar.new(4), space.new(1), bar.new(1)],
    'A4' => [space.new(1), bar.new(1), space.new(3), bar.new(2)],
    'A5' => [space.new(1), bar.new(2), space.new(3), bar.new(1)],
    'A6' => [space.new(1), bar.new(1), space.new(1), bar.new(4)],
    'A7' => [space.new(1), bar.new(3), space.new(1), bar.new(2)],
    'A8' => [space.new(1), bar.new(2), space.new(1), bar.new(3)],
    'A9' => [space.new(3), bar.new(1), space.new(1), bar.new(2)],
  }

  set_b_mappings = {
    'B0' => [space.new(1), bar.new(1), space.new(2), bar.new(3)],
    'B1' => [space.new(1), bar.new(2), space.new(2), bar.new(2)],
    'B2' => [space.new(2), bar.new(2), space.new(1), bar.new(2)],
    'B3' => [space.new(1), bar.new(1), space.new(4), bar.new(1)],
    'B4' => [space.new(2), bar.new(3), space.new(1), bar.new(1)],
    'B5' => [space.new(1), bar.new(3), space.new(2), bar.new(1)],
    'B6' => [space.new(4), bar.new(1), space.new(1), bar.new(1)],
    'B7' => [space.new(2), bar.new(1), space.new(3), bar.new(1)],
    'B8' => [space.new(3), bar.new(1), space.new(2), bar.new(1)],
    'B9' => [space.new(2), bar.new(1), space.new(1), bar.new(3)],
  }

  set_c_mappings = {
    'C0' => [bar.new(3), space.new(2), bar.new(1), space.new(1)],
    'C1' => [bar.new(2), space.new(2), bar.new(2), space.new(1)],
    'C2' => [bar.new(2), space.new(1), bar.new(2), space.new(2)],
    'C3' => [bar.new(1), space.new(4), bar.new(1), space.new(1)],
    'C4' => [bar.new(1), space.new(1), bar.new(3), space.new(2)],
    'C5' => [bar.new(1), space.new(2), bar.new(3), space.new(1)],
    'C6' => [bar.new(1), space.new(1), bar.new(1), space.new(4)],
    'C7' => [bar.new(1), space.new(3), bar.new(1), space.new(2)],
    'C8' => [bar.new(1), space.new(2), bar.new(1), space.new(3)],
    'C9' => [bar.new(3), space.new(1), bar.new(1), space.new(2)],
  }


  describe 'Set A' do
    set_a_mappings.each do |name, valid_pattern|
      it "has valid pattern in #{name}" do
        bands = described_class.new(name).bands

        expect(bands).to eq valid_pattern

        # Width of symbol character must be 7X
        expect(bands.sum(&:width)).to eq 7

        # Set A symbol character has odd parity
        expect(bands.grep(Jan::Symbol::Band::Bar).sum(&:width)).to be_odd
      end
    end
  end

  describe 'Set B' do
    set_b_mappings.each do |name, valid_pattern|
      it "has valid pattern in #{name}" do
        bands = described_class.new(name).bands

        expect(bands).to eq valid_pattern

        # Width of symbol character must be 7X
        expect(bands.sum(&:width)).to eq 7

        # Set A symbol character has odd parity
        expect(bands.grep(Jan::Symbol::Band::Bar).sum(&:width)).to be_even
      end
    end
  end

  describe 'Set C' do
    set_c_mappings.each do |name, valid_pattern|
      it "has valid pattern in #{name}" do
        bands = described_class.new(name).bands

        expect(bands).to eq valid_pattern

        # Width of symbol character must be 7X
        expect(bands.sum(&:width)).to eq 7

        # Set A symbol character has odd parity
        expect(bands.grep(Jan::Symbol::Band::Bar).sum(&:width)).to be_even
      end
    end
  end
end
