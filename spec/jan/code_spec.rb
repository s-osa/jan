require 'spec_helper'

describe Jan::Code do
  describe '#valid?' do
    context 'valid codes' do
      valid_codes = %w[
        0000000000000
        4901277241126
        2000000000015
        00000000
        49123456
      ]

      valid_codes.each do |valid_code|
        it("#{valid_code} is valid"){ expect(described_class.new(valid_code)).to be_valid }
      end
    end

    context 'invalid codes' do
      invalid_codes = [
        '11',
        '123abc',
        '4901277241127', #Invalid check digit
        '4901277 241126',
        '4901277 24112',
        '49123457', # Invalid check digit
      ]

      invalid_codes.each do |invalid_code|
        it("#{invalid_code} is invalid"){ expect(described_class.new(invalid_code)).not_to be_valid }
      end
    end
  end

  describe '#body' do
    it('returns body digits'){ expect(described_class.new('4901277241126').body).to eq('490127724112') }
  end

  describe '#check_digit' do
    it('returns check digit'){ expect(described_class.new('4901277241126').check_digit).to eq('6') }
  end

  describe '#instore_code?' do
    context 'instore code' do
      it('is true'){ expect(described_class.new('2101085089347')).to be_instore_code }
    end

    context 'global code' do
      it('is false'){ expect(described_class.new('4901277241126')).not_to be_instore_code }
    end
  end

  describe '#instore_marking?' do
    context 'instore marking' do
      it('is true'){ expect(described_class.new('2101085089347')).to be_instore_marking }
    end

    context 'source marking' do
      it('is false'){ expect(described_class.new('4901277241126')).not_to be_instore_marking }
    end
  end

  describe '#source_marking?' do
    context 'instore marking' do
      it('is true'){ expect(described_class.new('4901277241126')).to be_source_marking }
    end

    context 'source marking' do
      it('is false'){ expect(described_class.new('2101085089347')).not_to be_source_marking }
    end
  end
end
