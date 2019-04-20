require 'spec_helper'

describe Jan::Symbol::Band::Bar do
  describe 'initializer' do
    it 'receives width' do
      bar = described_class.new(1)
      expect(bar).to be_an_instance_of(described_class)
      expect(bar.color).to eq 'black'
    end

    it 'receives width and color' do
      bar = described_class.new(1, color: 'gray')
      expect(bar).to be_an_instance_of(described_class)
      expect(bar.color).to eq 'gray'
    end
  end
end
