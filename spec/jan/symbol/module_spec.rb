require 'spec_helper'

describe Jan::Symbol::Module do
  describe 'initializer' do
    it 'receives width and color' do
      bar = described_class.new(1, color: 'black')
      expect(bar).to be_an_instance_of(described_class)
    end

    it 'raises error if color missing' do
      expect{ described_class.new(1) }.to raise_error ArgumentError
    end
  end

  describe 'equality' do
    context 'same width, same color' do
      it 'equals' do
        bar1 = described_class.new(1, color: 'black')
        bar2 = described_class.new(1, color: 'black')
        expect(bar1).to eq bar2
      end
    end

    context 'same width, different color' do
      it 'does not equal' do
        bar1 = described_class.new(1, color: 'black')
        bar2 = described_class.new(1, color: 'white')
        expect(bar1).not_to eq bar2
      end
    end

    context 'different width, same color' do
      it 'does not equal' do
        bar1 = described_class.new(1, color: 'black')
        bar2 = described_class.new(2, color: 'black')
        expect(bar1).not_to eq bar2
      end
    end

    context 'different width, different color' do
      it 'does not equal' do
        bar1 = described_class.new(1, color: 'black')
        bar2 = described_class.new(2, color: 'white')
        expect(bar1).not_to eq bar2
      end
    end
  end
end
