require 'spec_helper'

describe Jan::Symbol::BandPattern::LeftQuietZone do
  let(:left_quiet_zone) { described_class.new }
  let(:bar) { Jan::Symbol::Band::Bar }
  let(:space) { Jan::Symbol::Band::Space }

  describe '#bands' do
    it { expect(left_quiet_zone.bands).to eq [space.new(11)] }
  end
end
