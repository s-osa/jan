require 'spec_helper'

describe Jan::Symbol::BandPattern::NormalGuardPattern do
  let(:normal_guard_pattern) { described_class.new }
  let(:bar) { Jan::Symbol::Band::Bar }
  let(:space) { Jan::Symbol::Band::Space }

  describe '#bands' do
    it { expect(normal_guard_pattern.bands).to eq [bar.new(1), space.new(1), bar.new(1)] }
  end
end
