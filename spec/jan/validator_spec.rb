require "spec_helper"

describe Jan::Validator do
  describe ".validate" do
    context "valid codes" do
      valid_codes = [
        "4901277241126",
        4901277241126,
        "49123456",
        49123456
      ]

      valid_codes.each do |code|
        it "#{code} should be valid" do
          actual = Jan::Validator.validate(code)
          expect(actual).to be true
        end
      end
    end

    context "invalid codes" do
      valid_codes = [
        "0000000000000",
        "11",
        "123abc",
        "4901277 241126",
        "4901277 24112"
      ]

      valid_codes.each do |code|
        it "#{code} should be valid" do
          actual = Jan::Validator.validate(code)
          expect(actual).to be false
        end
      end
    end
  end
end
