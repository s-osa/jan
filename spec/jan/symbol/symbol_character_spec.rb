require 'spec_helper'

describe Jan::Symbol::SymbolCharacter do
  Bar = Jan::Symbol::Bar
  Space = Jan::Symbol::Space

  set_a_mappings = {
    'A0' => [Space.new(3), Bar.new(2), Space.new(1), Bar.new(1)],
    'A1' => [Space.new(2), Bar.new(2), Space.new(2), Bar.new(1)],
    'A2' => [Space.new(2), Bar.new(1), Space.new(2), Bar.new(2)],
    'A3' => [Space.new(1), Bar.new(4), Space.new(1), Bar.new(1)],
    'A4' => [Space.new(1), Bar.new(1), Space.new(3), Bar.new(2)],
    'A5' => [Space.new(1), Bar.new(2), Space.new(3), Bar.new(1)],
    'A6' => [Space.new(1), Bar.new(1), Space.new(1), Bar.new(4)],
    'A7' => [Space.new(1), Bar.new(3), Space.new(1), Bar.new(2)],
    'A8' => [Space.new(1), Bar.new(2), Space.new(1), Bar.new(3)],
    'A9' => [Space.new(3), Bar.new(1), Space.new(1), Bar.new(2)],
  }

  set_b_mappings = {
    'B0' => [Space.new(1), Bar.new(1), Space.new(2), Bar.new(3)],
    'B1' => [Space.new(1), Bar.new(2), Space.new(2), Bar.new(2)],
    'B2' => [Space.new(2), Bar.new(2), Space.new(1), Bar.new(2)],
    'B3' => [Space.new(1), Bar.new(1), Space.new(4), Bar.new(1)],
    'B4' => [Space.new(2), Bar.new(3), Space.new(1), Bar.new(1)],
    'B5' => [Space.new(1), Bar.new(3), Space.new(2), Bar.new(1)],
    'B6' => [Space.new(4), Bar.new(1), Space.new(1), Bar.new(1)],
    'B7' => [Space.new(2), Bar.new(1), Space.new(3), Bar.new(1)],
    'B8' => [Space.new(3), Bar.new(1), Space.new(2), Bar.new(1)],
    'B9' => [Space.new(2), Bar.new(1), Space.new(1), Bar.new(3)],
  }

  set_c_mappings = {
    'C0' => [Bar.new(3), Space.new(2), Bar.new(1), Space.new(1)],
    'C1' => [Bar.new(2), Space.new(2), Bar.new(2), Space.new(1)],
    'C2' => [Bar.new(2), Space.new(1), Bar.new(2), Space.new(2)],
    'C3' => [Bar.new(1), Space.new(4), Bar.new(1), Space.new(1)],
    'C4' => [Bar.new(1), Space.new(1), Bar.new(3), Space.new(2)],
    'C5' => [Bar.new(1), Space.new(2), Bar.new(3), Space.new(1)],
    'C6' => [Bar.new(1), Space.new(1), Bar.new(1), Space.new(4)],
    'C7' => [Bar.new(1), Space.new(3), Bar.new(1), Space.new(2)],
    'C8' => [Bar.new(1), Space.new(2), Bar.new(1), Space.new(3)],
    'C9' => [Bar.new(3), Space.new(1), Bar.new(1), Space.new(2)],
  }


  describe 'Set A' do
    set_a_mappings.each do |name, valid_pattern|
      it "has valid pattern in #{name}" do
        modules = described_class.new(name).modules

        expect(modules).to eq valid_pattern

        # Width of symbol character must be 7X
        expect(modules.sum(&:width)).to eq 7

        # Set A symbol character has odd parity
        expect(modules.grep(Jan::Symbol::Bar).sum(&:width)).to be_odd
      end
    end
  end

  describe 'Set B' do
    set_b_mappings.each do |name, valid_pattern|
      it "has valid pattern in #{name}" do
        modules = described_class.new(name).modules

        expect(modules).to eq valid_pattern

        # Width of symbol character must be 7X
        expect(modules.sum(&:width)).to eq 7

        # Set A symbol character has odd parity
        expect(modules.grep(Jan::Symbol::Bar).sum(&:width)).to be_even
      end
    end
  end

  describe 'Set C' do
    set_c_mappings.each do |name, valid_pattern|
      it "has valid pattern in #{name}" do
        modules = described_class.new(name).modules

        expect(modules).to eq valid_pattern

        # Width of symbol character must be 7X
        expect(modules.sum(&:width)).to eq 7

        # Set A symbol character has odd parity
        expect(modules.grep(Jan::Symbol::Bar).sum(&:width)).to be_even
      end
    end
  end
end
