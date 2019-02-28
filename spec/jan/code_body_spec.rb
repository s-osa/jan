require 'spec_helper'

describe Jan::CodeBody do
  describe '#calculate_check_digit' do
    it('generates and returns check digit') do
      res = described_class.new('490127724112').calculate_check_digit
      expect(res.class).to eq(Jan::CheckDigit)
      expect(res).to eq('6')

    end
  end

  describe '#generate_code' do
    it('generates and returns check digit') do
      res = described_class.new('490127724112').generate_code
      expect(res.class).to eq(Jan::Code)
      expect(res).to eq('4901277241126')
    end
  end
end
