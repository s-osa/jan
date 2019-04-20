require 'spec_helper'

describe Jan::Symbol::BandPattern::RightQuietZone do
  let(:right_quiet_zone) { described_class.new }
  let(:bar) { Jan::Symbol::Band::Bar }
  let(:space) { Jan::Symbol::Band::Space }

  describe '#bands' do
    it { expect(right_quiet_zone.bands).to eq [space.new(7)] }
  end
end
