require 'spec_helper'

describe Jan::Random do
  let(:random) { described_class.new }

  describe '#code' do
    it 'returns code' do
      code = random.code
      expect(code).to be_an_instance_of(Jan::Code)
      expect(code).to be_valid
    end
  end

  describe '#instore_code' do
    it 'returns in-store code' do
      code = random.instore_code
      expect(code).to be_an_instance_of(Jan::Code)
      expect(code).to be_valid
      expect(code).to be_instore_code
    end
  end
end
